import 'dart:convert';

import 'package:acf_cli/models/user.dart';
import 'package:acf_cli/repositories/user/user_repository.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImpl implements UserRepository {
  static String url = "http://localhost:8080/users";

  @override
  Future<void> deleteById(int id) async {
    Uri uri = Uri.parse('$url/$id');
    await http.delete(uri);
  }

  @override
  Future<List<User>> findAll() async {
    // Uri uri = Uri.parse(url);
    // final response = await http.get(uri);
    // final json = jsonEncode(response.body);
    return [];
  }

  @override
  Future<User> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<void> insert(User user) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<void> update(User user) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
