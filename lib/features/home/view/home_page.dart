import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/products_grid.dart';
import '../widgets/cart_fab.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: ProductsGrid(),
      floatingActionButton: CartFAB(),
    );
  }
}
