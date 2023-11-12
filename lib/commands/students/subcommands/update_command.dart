// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:acf_cli/models/address.dart';
import 'package:acf_cli/models/city.dart';
import 'package:acf_cli/models/phone.dart';
import 'package:acf_cli/models/student.dart';
import 'package:acf_cli/repositories/product/product_repository_impl.dart';
import 'package:acf_cli/repositories/student/student_repository_impl.dart';
import 'package:args/command_runner.dart';

class UpdateCommand extends Command {
  @override
  String get description => 'Update User';

  @override
  String get name => 'update';

  StudentRepositoryImpl repository;

  ProductRepositoryImpl productRepository = ProductRepositoryImpl();

  UpdateCommand({
    required this.repository,
  }) {
    argParser.addOption('file', help: 'Path of the csv file', abbr: 'f');
    argParser.addOption('id', help: 'Student ID', abbr: 'i');
  }

  @override
  FutureOr? run() async {
    print('Aguarde...');
    final filePath = argResults?['file'];
    final id = argResults?['id'];

    if (id == null) {
      print('Preencha o id --id={id} ou -i {id}');
      return;
    }

    final students = File(filePath).readAsLinesSync();
    print('Aguarde, atualizando dados do aluno');
    print('--------------------------------');
    if (students.length > 1) {
      print('Por favor informe somente um aluno no arquivo $filePath');
      return;
    }

    var student = students.first;

    final studentData = student.split(';');
    final courseCsv = studentData[2].split(',').map((e) => e.trim()).toList();

    final courseFutures = courseCsv.map((c) async {
      final course = await productRepository.findByName(c);
      course.isStudent = true;
      return course;
    }).toList();

    final courses = await Future.wait(courseFutures);

    final studentModel = Student(
      id: int.parse(id),
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

    await repository.update(studentModel);

    print('Aluno atualizado com sucesso!');
  }
}
