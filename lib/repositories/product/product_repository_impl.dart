import 'dart:convert';

import 'package:acf_cli/models/product.dart';
import 'package:acf_cli/repositories/product/product_repository.dart';
import 'package:http/http.dart' as http;

class ProductRepositoryImpl implements ProductRepository {
  static String url = 'http://192.168.141.166:8080/products';

  @override
  Future<Product> findByName(String name) async {
    final response = await http.get(Uri.parse('$url?name=$name'));

    if (response.statusCode != 200) {
      throw Exception();
    }

    final responseData = jsonDecode(response.body);

    if (responseData.isEmpty) {
      throw Exception('Produto não encontrado');
    }

    return Product.fromMap(responseData.first);
  }
}
