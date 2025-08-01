import 'package:dio/dio.dart';
import 'package:smartcart/data/models/product.dart';

class ProductRepository {
  final Dio _dio = Dio();

  Future<List<Product>> fetchProducts() async {
    final response = await _dio.get(
      "https://dummyjson.com/products/category/smartphones",
    );

    final data = response.data["products"] as List;

    return data.map((json) => Product.fromJson(json)).toList();
  }
}
