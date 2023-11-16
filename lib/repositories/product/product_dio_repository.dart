import 'package:acf_cli/models/course.dart';
import 'package:dio/dio.dart';

class ProductDioRepository {
  Future<Course> findByName(String name) async {
    try {
      final response = await Dio().get(
        'http://localhost:8080/products',
        queryParameters: {'name': name},
      );

      if (response.data.isEmpty) {
        throw Exception('Produto não encontrado');
      }

      return Course.fromMap(response.data.first);
      // ignore: deprecated_member_use
    } on DioError {
      throw Exception();
    }
  }
}
