import 'package:acf_cli/models/student.dart';
import 'package:dio/dio.dart';

class StudentDioRepository {
  static String url = 'http://localhost:8080/students';

  Future<List<Student>> findAll() async {
    try {
      final result = await Dio().get(url);
      return result.data.map<Student>((student) {
        return Student.fromMap(student);
      }).toList();
    } on DioException catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<Student> findById(int id) async {
    try {
      final result = await Dio().get('$url/$id');
      if (result.data == null) {
        throw Exception();
      }

      return Student.fromMap(result.data);
    } on DioException catch (e) {
      print(e);
      throw Exception();
    }
  }
}
