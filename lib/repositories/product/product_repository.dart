import 'package:acf_cli/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> findAll();

  Future<void> insert(Product obj);

  Future<void> update(Product obj);

  Future<void> delteById(int id);

  Future<Product> findById(int id);
}
