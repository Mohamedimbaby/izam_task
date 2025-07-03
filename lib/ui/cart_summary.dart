import 'package:flutter/material.dart';
import 'package:task_izam/src/cart/models.dart';

class CartSummary extends StatelessWidget {
  final CartState state;

  const CartSummary({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Subtotal: \$${state.subtotal.toStringAsFixed(2)}'),
          if (state.totalDiscount > 0)
            Text('Discount: -\$${state.totalDiscount.toStringAsFixed(2)}'),
          Text('VAT (15%): \$${state.vat.toStringAsFixed(2)}'),
          const Divider(),
          Text(
            'Total: \$${state.total.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
