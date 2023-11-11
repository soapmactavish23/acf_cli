import 'dart:convert';

import 'package:acf_cli/models/user.dart';
import 'package:acf_cli/repositories/user/user_repository.dart';
import 'package:acf_cli/utils/msgs.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImpl implements UserRepository {
  static String urlStr = "http://localhost:8080/users";
  Uri uri = Uri.parse(urlStr);

  @override
  Future<void> deleteById(int id) async {
    Uri uri = Uri.parse('$urlStr/$id');
    await http.delete(uri);
  }

  @override
  Future<List<User>> findAll() async {
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception(Msgs.msgNoConnection);
    }

    final data = jsonDecode(response.body) as List;
    return data.map((e) => User.fromMap(e)).toList();
  }

  @override
  Future<User> findById(int id) async {
    Uri uri = Uri.parse('$urlStr/$id');
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception(Msgs.msgNoConnection);
    } else if (response.body == '{}') {
      throw Exception(Msgs.msg404);
    } else {
      final data = jsonDecode(response.body);
      return User.fromMap(data);
    }
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
