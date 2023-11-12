import 'dart:async';
import 'dart:io';

import 'package:acf_cli/models/address.dart';
import 'package:acf_cli/models/city.dart';
import 'package:acf_cli/models/phone.dart';
import 'package:acf_cli/models/student.dart';
import 'package:acf_cli/repositories/product/product_repository_impl.dart';
import 'package:acf_cli/repositories/student/student_repository_impl.dart';
import 'package:args/command_runner.dart';

class InsertCommand extends Command {
  final StudentRepositoryImpl repository;
  final productRepository = ProductRepositoryImpl();

  @override
  String get description => 'Insert Student';

  @override
  String get name => 'insert';

  InsertCommand(this.repository) {
    argParser.addOption('file', help: 'Path of the csv file', abbr: 'f');
  }

  @override
  FutureOr? run() async {
    print('Aguarde...');
    final filePath = argResults?['file'];
    final students = File(filePath).readAsLinesSync();
    print('--------------------------------');

    for (var student in students) {
      final studentData = student.split(';');
      final courseCsv = studentData[2].split(',').map((e) => e.trim()).toList();

      final courseFutures = courseCsv.map((c) async {
        final course = await productRepository.findByName(c);
        course.isStudent = true;
        return course;
      }).toList();

      final courses = await Future.wait(courseFutures);

      final studentModel = Student(
        name: studentData[0],
        age: int.tryParse(studentData[1]),
        nameCourses: courseCsv,
        courses: courses,
        address: Address(
          street: studentData[3],
          number: int.parse(studentData[4]),
          zipCode: studentData[5],
          city: City(id: 1, name: studentData[6]),
          phone: Phone(ddd: int.parse(studentData[7]), phone: studentData[8]),
        ),
      );

      repository.insert(studentModel);

      print('--------------------------------');
      print('Alunos adicionados com sucesso!');
    }
  }
}
