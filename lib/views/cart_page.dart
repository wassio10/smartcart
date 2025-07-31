import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartcart/viewmodels/products_viewmodel.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Shopping cart'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: cart.isEmpty
          ? const Center(child: Text('The basket is empty'))
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final product = cart[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      product.thumbnail,
                      fit: BoxFit.fitHeight,
                    ),
                    title: Text(product.title),
                    subtitle: Text('${product.price} \$'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () {
                        ref.read(cartProvider.notifier).removeFromCart(product);
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: cart.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Center(child: Text('Purchase successful!')),
                  ),
                );
                ref.read(cartProvider.notifier).clearCart();
              },
              label: const Text('buying'),
              icon: const Icon(Icons.payment),
            )
          : null,
    );
  }
}
