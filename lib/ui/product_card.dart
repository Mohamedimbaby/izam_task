import 'package:flutter/material.dart';
import 'package:task_izam/src/cart/cart_bloc.dart';
import 'package:task_izam/src/catalog/item.dart';

class ProductCard extends StatelessWidget {
  final Item item;
  final CartCubit cartCubit;

  const ProductCard({super.key, required this.item, required this.cartCubit});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          cartCubit.addItem(item);

        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                '\$${item.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
