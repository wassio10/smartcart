import 'package:flutter/material.dart';
import 'package:smartcart/models/product.dart';

class ProductImage extends StatelessWidget {
  final Product product;
  const ProductImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'product_${product.id}',
      child: AspectRatio(
        aspectRatio: 1.5,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
          child: Image.network(
            product.thumbnail,
            fit: BoxFit.fitHeight,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 80),
          ),
        ),
      ),
    );
  }
}
