import 'package:bloc/bloc.dart';
import '../catalog/item.dart';
import 'models.dart';

class CartCubit extends Cubit<CartState> {
  static const double vatRate = 0.15;

  CartCubit() : super(const CartState());

  void addItem(Item item, {int qty = 1, double discount = 0.0}) {
    final existing = state.items.where((e) => e.item.id == item.id).toList();
    List<CartItem> updatedItems;
    if (existing.isNotEmpty) {
      updatedItems = state.items.map((e) {
        if (e.item.id == item.id) {
          return e.copyWith(qty: e.qty + qty);
        }
        return e;
      }).toList();
    } else {
      updatedItems = List.from(state.items)
        ..add(CartItem(item: item, qty: qty, discount: discount));
    }
    _emitWithRecalc(updatedItems);
  }

  void removeItem(String itemId) {
    final updatedItems = state.items.where((e) => e.item.id != itemId).toList();
    _emitWithRecalc(updatedItems);
  }

  void changeQty(String itemId, int qty) {
    final updatedItems = state.items.map((e) {
      if (e.item.id == itemId) {
        return e.copyWith(qty: qty);
      }
      return e;
    }).toList();
    _emitWithRecalc(updatedItems);
  }

  void changeDiscount(String itemId, double discount) {
    final updatedItems = state.items.map((e) {
      if (e.item.id == itemId) {
        return e.copyWith(discount: discount);
      }
      return e;
    }).toList();
    _emitWithRecalc(updatedItems);
  }

  void clearCart() {
    emit(const CartState());
  }

  void _emitWithRecalc(List<CartItem> items) {
    final subtotal = items.fold(0.0, (sum, e) => sum + e.item.price * e.qty);
    final totalDiscount =
        items.fold(0.0, (sum, e) => sum + (e.item.price * e.qty * e.discount));
    final vat = (subtotal - totalDiscount) * vatRate;
    final total = subtotal - totalDiscount + vat;
    emit(CartState(
      items: items,
      subtotal: subtotal,
      vat: vat,
      totalDiscount: totalDiscount,
      total: total,
    ));
  }
}
