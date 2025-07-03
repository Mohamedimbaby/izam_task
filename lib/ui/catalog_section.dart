import 'package:flutter/material.dart';
import 'package:task_izam/src/cart/cart_bloc.dart';
import 'package:task_izam/src/catalog/catalog_bloc.dart';

import 'product_card.dart';

class CatalogSection extends StatelessWidget {
  final CatalogCubit catalogCubit;
  final CartCubit cartCubit;

  const CatalogSection(
      {super.key, required this.catalogCubit, required this.cartCubit});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CatalogState>(
      stream: catalogCubit.stream,
      builder: (context, snapshot) {
        final state = snapshot.data ?? CatalogInitial();

        if (state is CatalogLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CatalogLoaded) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Product Catalog',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return ProductCard(item: item, cartCubit: cartCubit);
                  },
                ),
              ),
            ],
          );
        } else if (state is CatalogError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const Center(child: Text('Loading catalog...'));
      },
    );
  }
}
