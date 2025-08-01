import 'package:flutter/material.dart';
import 'package:smartcart/data/models/product.dart';
import 'package:smartcart/features/details/widgets/add_to_cart_button.dart';
import 'package:smartcart/features/details/widgets/product_image.dart';
import 'package:smartcart/features/details/widgets/product_info_section.dart';

class DetailsPage extends StatelessWidget {
  final Product product;
  const DetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(product: product),
            const SizedBox(height: 16),
            ProductInfoSection(product: product),
            const SizedBox(height: 30),
            AddToCartButton(product: product),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
