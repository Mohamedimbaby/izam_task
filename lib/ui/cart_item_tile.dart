import 'package:flutter/material.dart';
import 'package:task_izam/src/cart/cart_bloc.dart';
import 'package:task_izam/src/cart/models.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;
  final CartCubit cartCubit;

  const CartItemTile(
      {super.key, required this.cartItem, required this.cartCubit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    cartItem.item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    cartCubit.removeItem(cartItem.item.id);
                  },
                ),
              ],
            ),
            Row(
              children: [
                Text('\$${cartItem.item.price.toStringAsFixed(2)}'),
                const SizedBox(width: 16),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        if (cartItem.qty > 1) {
                          cartCubit.changeQty(
                              cartItem.item.id, cartItem.qty - 1);
                        }
                      },
                    ),
                    Text('${cartItem.qty}'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        cartCubit.changeQty(cartItem.item.id, cartItem.qty + 1);
                      },
                    ),
                  ],
                ),
              ],
            ),
            if (cartItem.discount > 0)
              Text(
                'Discount: ${(cartItem.discount * 100).toStringAsFixed(0)}%',
                style: const TextStyle(color: Colors.green),
              ),
            Text(
              'Net: \$${cartItem.netLine.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}