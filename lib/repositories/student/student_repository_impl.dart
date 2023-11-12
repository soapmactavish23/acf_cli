import 'dart:convert';

import 'package:acf_cli/models/student.dart';
import 'package:acf_cli/repositories/student/student_repository.dart';
import 'package:http/http.dart' as http;

class StudentRepositoryImpl implements StudentRepository {
  static String urlStr = 'http://localhost:8080/students';
  static Uri url = Uri.parse(urlStr);

  @override
  Future<List<Student>> findAll() async {
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception();
    } else {
      final data = jsonDecode(response.body) as List;
      return data.map((e) => Student.fromMap(e)).toList();
    }
  }

  @override
  Future<Student> findById(int id) async {
    Uri uri = Uri.parse('$urlStr/$id');
    final result = await http.get(uri);
    if (result.statusCode != 200) {
      throw Exception();
    } else if (result.body == '[]') {
      throw Exception();
    } else {
      return Student.fromJson(result.body);
    }
  }

  @override
  Future<void> insert(Student obj) async {
    final response = await http.post(
      url,
      body: obj.toJson(),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  @override
  Future<void> update(Student obj) async {
    Uri uri = Uri.parse('$urlStr/${obj.id}');
    final response = await http.put(
      uri,
      body: obj.toJson(),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  @override
  Future<void> deleteById(int id) async {
    Uri uri = Uri.parse('$urlStr/$id');
    final response = await http.delete(uri);

    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
