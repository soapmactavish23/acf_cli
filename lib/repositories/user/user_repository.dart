import 'package:acf_cli/models/user.dart';

abstract class UserRepository {
  Future<void> insert(User user);

  Future<void> update(User user);

  Future<List<User>> findAll();

  Future<User> findById(int id);

  Future<void> deleteById(int id);
}
