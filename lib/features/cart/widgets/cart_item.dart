import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartcart/data/models/product.dart';
import 'package:smartcart/shared/providers/products_provider.dart';

class CartItem extends ConsumerWidget {
  final Product product;

  const CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
  }
}
