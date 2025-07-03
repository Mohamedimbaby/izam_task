import 'package:flutter_test/flutter_test.dart';
import 'package:task_izam/src/cart/cart_bloc.dart';
import 'package:task_izam/src/catalog/item.dart';
import 'package:task_izam/src/cart/models.dart';

void main() {
  final coffee = Item(id: 'p01', name: 'Coffee', price: 2.50);
  final bagel = Item(id: 'p02', name: 'Bagel', price: 3.20);

  group('CartCubit', () {
    test('two items → correct totals', () {
      final cubit = CartCubit();
      cubit.addItem(coffee, qty: 2); // 2 x 2.5 = 5.0
      cubit.addItem(bagel, qty: 1); // 1 x 3.2 = 3.2
      final state = cubit.state;
      expect(state.subtotal, closeTo(8.2, 0.001));
      expect(state.totalDiscount, 0.0);
      expect(state.vat, closeTo(1.23, 0.01)); // (8.2-0)*0.15
      expect(state.total, closeTo(9.43, 0.01));
    });

    test('qty/discount updates → updated totals', () {
      final cubit = CartCubit();
      cubit.addItem(coffee, qty: 1);
      cubit.changeQty('p01', 3); // 3 x 2.5 = 7.5
      cubit.changeDiscount('p01', 0.2); // 20% off
      final state = cubit.state;
      expect(state.subtotal, closeTo(7.5, 0.001));
      expect(state.totalDiscount, closeTo(1.5, 0.001)); // 7.5*0.2
      expect(state.vat, closeTo(0.9, 0.01)); // (7.5-1.5)*0.15
      expect(state.total, closeTo(6.9, 0.01));
    });

    test('clear cart resets state', () {
      final cubit = CartCubit();
      cubit.addItem(coffee, qty: 1);
      cubit.clearCart();
      final state = cubit.state;
      expect(state.items, isEmpty);
      expect(state.subtotal, 0.0);
      expect(state.total, 0.0);
    });
  });
}
