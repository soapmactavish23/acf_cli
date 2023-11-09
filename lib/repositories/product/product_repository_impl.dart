import 'package:acf_cli/models/product.dart';
import 'package:acf_cli/repositories/product/product_repository.dart';
import 'package:http/http.dart' as http;

class ProductRepositoryImpl implements ProductRepository {
  static String url = 'http://192.168.141.166:8080/products';

  @override
  Future<void> delteById(int id) async {
    try {
      Uri uri = Uri.parse('$url/$id');
      await http.delete(uri);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<Product> findById(int id) async {
    Uri uri = Uri.parse('$url/$id');
    final response = await http.get(uri);
    return Product.fromMap(response as Map<String, dynamic>);
  }

  @override
  Future<void> insert(Product obj) async {
    Uri uri = Uri.parse(url);
    await http.post(uri, body: obj.toJson());
  }

  @override
  Future<List<Product>> findAll() async {
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    return List.from(response as List<Map<String, dynamic>>)
        .map((e) => Product.fromMap(e))
        .toList();
  }

  @override
  Future<void> update(Product obj) async {
    Uri uri = Uri.parse('$url/${obj.id}');
    await http.put(uri, body: obj.toJson());
  }
}
