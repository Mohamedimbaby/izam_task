import 'package:flutter_test/flutter_test.dart';
import 'package:task_izam/src/catalog/catalog_bloc.dart';
import 'package:task_izam/src/catalog/item.dart';

void main() {
  group('CatalogCubit', () {
    testWidgets('loads catalog from JSON', (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final cubit = CatalogCubit();
      final path = 'assets/catalog.json';
      await cubit.loadCatalog(path);
      expect(cubit.state, isA<CatalogLoaded>());
      final items = (cubit.state as CatalogLoaded).items;
      expect(items.length, 20);
      expect(items.first, isA<Item>());
      expect(items.first.name, 'Coffee');
    });
  });
}
