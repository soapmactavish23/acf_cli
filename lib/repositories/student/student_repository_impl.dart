import 'dart:convert';

import 'package:acf_cli/models/student.dart';
import 'package:acf_cli/repositories/student/student_repository.dart';
import 'package:http/http.dart' as http;

class StudentRepositoryImpl implements StudentRepository {
  static Uri url = Uri.parse('http://localhost:8080/students');

  @override
  Future<List<Student>> findAll() async {
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception();
    } else {
      List<Map<String, dynamic>> data = jsonDecode(response.body);
      return data.map(Student.fromMap).toList();
    }
  }

  @override
  Future<Student> findById(int id) async {
    final result = await http.get(url);
    if (result.statusCode != 200) {
      throw Exception();
    } else if (result.body == '[]') {
      throw Exception();
    } else {
      return Student.fromJson(result.body);
    }
  }

  @override
  Future<void> insert(Student obj) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<void> update(Student obj) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> deleteById(int id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }
}
