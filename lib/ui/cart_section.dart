import 'package:flutter/material.dart';
import 'package:task_izam/src/cart/cart_bloc.dart';
import 'package:task_izam/src/cart/models.dart';
import 'package:task_izam/ui/cart_actions.dart';
import 'package:task_izam/ui/cart_item_tile.dart';
import 'package:task_izam/ui/cart_summary.dart';

class CartSection extends StatelessWidget {
  final CartCubit cartCubit;

  const CartSection({super.key, required this.cartCubit});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CartState>(
      stream: cartCubit.stream,
      builder: (context, snapshot) {
        final state = snapshot.data ?? const CartState();

        return Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Shopping Cart',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: state.items.isEmpty
                    ? const Center(child: Text('Cart is empty'))
                    : ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final cartItem = state.items[index];
                    return CartItemTile(
                        cartItem: cartItem, cartCubit: cartCubit);
                  },
                ),
              ),
              CartSummary(state: state),
              CartActions(cartCubit: cartCubit),
            ],
          ),
        );
      },
    );
  }
}
