import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartcart/models/product.dart';
import 'package:smartcart/repositories/product_repository.dart';

final productsProvider = FutureProvider<List<Product>>((ref) async {
  return ProductRepository().fetchProducts();
});

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    if (!state.any((p) => p.id == product.id)) {
      state = [...state, product];
    }
  }

  void removeFromCart(Product product) {
    state = state.where((p) => p.id != product.id).toList();
  }

  void clearCart() {
    state = [];
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>((ref) {
  return CartNotifier();
});
