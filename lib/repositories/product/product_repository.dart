import 'package:acf_cli/models/product.dart';

abstract class ProductRepository {
  Future<Product> findByName(String name);
}
