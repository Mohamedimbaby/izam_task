import 'models.dart';
import '../catalog/item.dart';

class ReceiptLine {
  final String name;
  final int qty;
  final double price;
  final double discount;
  final double net;

  const ReceiptLine({
    required this.name,
    required this.qty,
    required this.price,
    required this.discount,
    required this.net,
  });
}

class Receipt {
  final List<ReceiptLine> lines;
  final double subtotal;
  final double vat;
  final double totalDiscount;
  final double total;
  final DateTime dateTime;

  const Receipt({
    required this.lines,
    required this.subtotal,
    required this.vat,
    required this.totalDiscount,
    required this.total,
    required this.dateTime,
  });
}

class ReceiptBuilder {
  static Receipt buildReceipt(CartState state, DateTime dateTime) {
    final lines = state.items
        .map((e) => ReceiptLine(
              name: e.item.name,
              qty: e.qty,
              price: e.item.price,
              discount: e.discount,
              net: e.netLine,
            ))
        .toList();
    return Receipt(
      lines: lines,
      subtotal: state.subtotal,
      vat: state.vat,
      totalDiscount: state.totalDiscount,
      total: state.total,
      dateTime: dateTime,
    );
  }
}
