import 'package:flutter/material.dart';
import 'package:smartcart/models/product.dart';
import 'package:smartcart/views/details/widgets/add_to_cart_button.dart';
import 'package:smartcart/views/details/widgets/product_image.dart';
import 'package:smartcart/views/details/widgets/product_info_section.dart';
import 'package:smartcart/widgets/appbar.dart';

class DetailsPage extends StatelessWidget {
  final Product product;
  const DetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(product.title),
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
