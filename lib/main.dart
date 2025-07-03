import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:task_izam/common/app_theme.dart';
import 'src/catalog/catalog_bloc.dart';
import 'src/cart/cart_bloc.dart';
import 'src/cart/models.dart';
import 'src/cart/receipt.dart';
import 'src/catalog/item.dart';
import 'ui/pos_home_page.dart';

void main() {
  runApp(const POSApp());
}

class POSApp extends StatelessWidget {
  const POSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POS Checkout Engine',
      theme: posCartTheme,
      home: const POSHomePage(),
    );
  }
}








