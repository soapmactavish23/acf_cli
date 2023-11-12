import 'package:acf_cli/models/course.dart';

abstract class ProductRepository {
  Future<Course> findByName(String name);
}
