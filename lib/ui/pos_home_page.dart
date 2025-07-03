import 'package:flutter/material.dart';
import 'package:task_izam/src/cart/cart_bloc.dart';
import 'package:task_izam/src/catalog/catalog_bloc.dart';
import 'package:task_izam/ui/cart_section.dart';
import 'package:task_izam/ui/catalog_section.dart';

class POSHomePage extends StatefulWidget {
  const POSHomePage({super.key});

  @override
  State<POSHomePage> createState() => _POSHomePageState();
}

class _POSHomePageState extends State<POSHomePage> {
  late CatalogCubit _catalogCubit;
  late CartCubit _cartCubit;

  @override
  void initState() {
    super.initState();
    _catalogCubit = CatalogCubit();
    _cartCubit = CartCubit();
    _catalogCubit.loadCatalog('assets/catalog.json');
  }

  @override
  void dispose() {
    _catalogCubit.close();
    _cartCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POS Checkout Engine'),
      ),
      body: Row(
        children: [
          // Catalog Section (Left)
          Expanded(
            flex: 1,
            child: CatalogSection(
                catalogCubit: _catalogCubit, cartCubit: _cartCubit),
          ),
          // Cart Section (Right)
          Expanded(
            flex: 2,
            child: CartSection(cartCubit: _cartCubit),
          ),
        ],
      ),
    );
  }
}

