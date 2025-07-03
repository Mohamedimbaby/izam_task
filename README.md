# Pure Dart POS Checkout Engine

A pure Dart, logic-only checkout engine for a point-of-sale (POS) system using BLoC pattern and clean architecture. This implementation focuses on clean, tested business logic without any UI components.

## 🚀 Features

- **CatalogCubit**: Loads product items from `assets/catalog.json`
- **CartCubit**: Manages cart state (add/remove/update/discount/clear)
- **Real-time calculations**: Subtotal, VAT (15%), discount, total
- **ReceiptBuilder**: Generates printable receipt DTO
- **Unit tests**: Comprehensive test coverage for business logic
- **Clean Architecture**: Immutable models, separation of concerns

## 📋 Requirements

- **Flutter**: 3.29.1
- **Dart**: 3.7.0
- **Dependencies**: bloc, equatable, bloc_test

## 🏗️ Project Structure

```
lib/
  src/
    catalog/
      item.dart              # Item model with JSON serialization
      catalog_bloc.dart      # CatalogCubit for loading items
      catalog_state.dart     # Catalog states (Initial, Loading, Loaded, Error)
    cart/
      models.dart            # CartItem and CartState models
      cart_bloc.dart         # CartCubit for cart operations
      receipt.dart           # Receipt DTO and ReceiptBuilder
assets/
  catalog.json              # 20 product items
test/
  catalog_bloc_test.dart    # CatalogCubit tests
  cart_bloc_test.dart       # CartCubit tests
```

## 🧪 Running Tests

```bash
# Install dependencies
flutter pub get

# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

## 📊 Test Results

All tests pass successfully:
- ✅ Catalog loading from JSON
- ✅ Two items → correct totals calculation
- ✅ Quantity/discount updates → updated totals
- ✅ Clear cart resets state

## 💰 Business Logic

- **VAT Rate**: 15%
- **Line Net**: `price × qty × (1 - discount%)`
- **Subtotal**: Sum of all line totals
- **VAT**: `(subtotal - totalDiscount) × 0.15`
- **Grand Total**: `subtotal - totalDiscount + vat`

## 🎯 Completed Features

### ✅ Must-Have Requirements
- [x] CatalogCubit loads items from JSON
- [x] CartCubit manages cart operations
- [x] Real-time total calculations
- [x] ReceiptBuilder generates DTO
- [x] 3+ unit tests
- [x] Immutable models
- [x] Clean architecture
- [x] dart analyze passes

### ✅ Bonus Features (Optional)
- [ ] Undo/Redo last N cart actions
- [ ] Hydrated BLoC (cart survives restart)
- [ ] 100% test coverage
- [ ] Money formatting extension

## ⏱️ Time Spent

- **Setup & Dependencies**: 15 minutes
- **Catalog Implementation**: 20 minutes
- **Cart Logic**: 30 minutes
- **Receipt Builder**: 15 minutes
- **Unit Tests**: 25 minutes
- **Documentation**: 10 minutes

**Total**: ~2 hours

## 🚀 Usage Example

```dart
// Load catalog
final catalogCubit = CatalogCubit();
await catalogCubit.loadCatalog('assets/catalog.json');

// Manage cart
final cartCubit = CartCubit();
cartCubit.addItem(coffee, qty: 2);
cartCubit.changeDiscount('p01', 0.1); // 10% off

// Generate receipt
final receipt = ReceiptBuilder.buildReceipt(cartCubit.state, DateTime.now());
```

## 📝 Notes

- Pure Dart implementation with no UI components
- Follows BLoC pattern using Cubit for state management
- All models are immutable and use Equatable
- Business logic is thoroughly tested
- Ready for integration with UI apps (POS/ESS)

## 🔧 Development

This project uses:
- **State Management**: bloc (Cubit)
- **Testing**: flutter_test, bloc_test
- **Code Quality**: flutter_lints
- **Immutability**: equatable

The implementation is production-ready and follows Dart/Flutter best practices.
