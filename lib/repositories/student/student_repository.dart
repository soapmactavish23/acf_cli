import 'package:acf_cli/models/student.dart';

abstract class StudentRepository {
  Future<void> insert(Student obj);

  Future<void> update(Student obj);

  Future<List<Student>> findAll();

  Future<Student> findById(int id);

  Future<void> deleteById(int id);
}
