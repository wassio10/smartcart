import 'package:go_router/go_router.dart';
import 'package:smartcart/models/product.dart';
import 'package:smartcart/views/home/home_page.dart';
import 'package:smartcart/views/cart/cart_page.dart';
import 'package:smartcart/views/details/details_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => const HomePage()),
    GoRoute(path: "/cartpage", builder: (context, state) => const CartPage()),
    GoRoute(
      path: "/detailspage",
      builder: (context, state) {
        final product = state.extra as Product;
        return DetailsPage(product: product);
      },
    ),
  ],
);
