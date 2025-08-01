import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartcart/shared/providers/products_provider.dart';
import '../widgets/cart_list.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Shopping cart")),
      body: cart.isEmpty
          ? const Center(child: Text('The basket is empty'))
          : CartList(cart: cart),
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
              label: const Text('Buying'),
              icon: const Icon(Icons.payment),
            )
          : null,
    );
  }
}
