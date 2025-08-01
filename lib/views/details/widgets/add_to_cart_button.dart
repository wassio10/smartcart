import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartcart/models/product.dart';
import 'package:smartcart/viewmodels/products_viewmodel.dart';

class AddToCartButton extends ConsumerWidget {
  final Product product;
  const AddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final alreadyInCart = cartItems.any((item) => item.id == product.id);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: alreadyInCart ? Colors.red : Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            if (alreadyInCart) {
              ref.read(cartProvider.notifier).removeFromCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Center(child: Text("Removed from cart!")),
                  duration: Duration(seconds: 1),
                ),
              );
            } else {
              ref.read(cartProvider.notifier).addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Center(child: Text("Added to cart!")),
                  duration: Duration(seconds: 1),
                ),
              );
            }
          },
          icon: Icon(
            alreadyInCart ? Icons.remove_shopping_cart : Icons.shopping_cart,
            color: Colors.white,
          ),
          label: Text(
            alreadyInCart ? "Remove from Cart" : "Add to Cart",
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
