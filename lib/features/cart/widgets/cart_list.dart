import 'package:flutter/material.dart';
import 'package:smartcart/data/models/product.dart';
import 'cart_item.dart';

class CartList extends StatelessWidget {
  final List<Product> cart;

  const CartList({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
      itemCount: cart.length,
      itemBuilder: (context, index) {
        final product = cart[index];
        return CartItem(product: product);
      },
    );
  }
}
