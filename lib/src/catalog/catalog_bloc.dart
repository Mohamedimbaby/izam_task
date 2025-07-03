import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'item.dart';

part 'catalog_state.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit() : super(CatalogInitial());

  Future<void> loadCatalog(String assetPath) async {
    emit(CatalogLoading());
    try {
      final jsonStr = await rootBundle.loadString(assetPath);
      final List<dynamic> data = json.decode(jsonStr);
      final items = data.map((e) => Item.fromJson(e)).toList();
      emit(CatalogLoaded(items));
    } catch (e) {
      emit(CatalogError(e.toString()));
    }
  }
}
