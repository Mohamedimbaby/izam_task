import 'package:flutter/material.dart';
import 'package:task_izam/src/cart/cart_bloc.dart';
import 'package:task_izam/src/cart/receipt.dart';

class CartActions extends StatelessWidget {
  final CartCubit cartCubit;

  const CartActions({super.key, required this.cartCubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                cartCubit.clearCart();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Clear',style: TextStyle(color: Colors.white,fontSize: 14),),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                final cartState = cartCubit.state;
                if (cartState.items.isNotEmpty) {
                  final receipt =
                  ReceiptBuilder.buildReceipt(cartState, DateTime.now());
                  _showReceipt(context, receipt);
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),

              child: const Text('Receipt',style: TextStyle(color: Colors.white,fontSize: 14),),
            ),
          ),
        ],
      ),
    );
  }

  void _showReceipt(BuildContext context, Receipt receipt) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Receipt'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Date: ${receipt.dateTime.toString().substring(0, 19)}'),
              const Divider(),
              ...receipt.lines.map((line) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                    '${line.name} x${line.qty} - \$${line.net.toStringAsFixed(2)}'),
              )),
              const Divider(),
              Text('Subtotal: \$${receipt.subtotal.toStringAsFixed(2)}'),
              if (receipt.totalDiscount > 0)
                Text(
                    'Discount: -\$${receipt.totalDiscount.toStringAsFixed(2)}'),
              Text('VAT: \$${receipt.vat.toStringAsFixed(2)}'),
              Text('Total: \$${receipt.total.toStringAsFixed(2)}'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}