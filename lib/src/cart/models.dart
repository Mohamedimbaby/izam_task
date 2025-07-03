import 'package:equatable/equatable.dart';
import '../catalog/item.dart';

class CartItem extends Equatable {
  final Item item;
  final int qty;
  final double discount; // 0.0 - 1.0 (e.g., 0.15 for 15%)

  const CartItem({
    required this.item,
    required this.qty,
    this.discount = 0.0,
  });

  double get netLine => item.price * qty * (1 - discount);

  CartItem copyWith({int? qty, double? discount}) {
    return CartItem(
      item: item,
      qty: qty ?? this.qty,
      discount: discount ?? this.discount,
    );
  }

  @override
  List<Object?> get props => [item, qty, discount];
}

class CartState extends Equatable {
  final List<CartItem> items;
  final double subtotal;
  final double vat;
  final double totalDiscount;
  final double total;

  const CartState({
    this.items = const [],
    this.subtotal = 0.0,
    this.vat = 0.0,
    this.totalDiscount = 0.0,
    this.total = 0.0,
  });

  CartState copyWith({
    List<CartItem>? items,
    double? subtotal,
    double? vat,
    double? totalDiscount,
    double? total,
  }) {
    return CartState(
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      vat: vat ?? this.vat,
      totalDiscount: totalDiscount ?? this.totalDiscount,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props => [items, subtotal, vat, totalDiscount, total];
}
