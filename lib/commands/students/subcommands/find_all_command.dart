// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

import 'package:acf_cli/repositories/student/student_repository_impl.dart';

class FindAllCommand extends Command {
  final StudentRepositoryImpl repository;
  FindAllCommand({
    required this.repository,
  });

  @override
  String get description => 'Find All Students';

  @override
  String get name => 'findAll';

  @override
  FutureOr? run() async {
    print('Aguarde Buscando alunos...');
    final students = await repository.findAll();
    print('Apresentar também os cursos? (S ou N)');
    final showCourses = stdin.readLineSync();
    print('----------------------------------');
    print('Alunos:');
    print('----------------------------------');
    for (var obj in students) {
      if (showCourses?.toLowerCase() == 's') {
        print(obj.toStringWithCourses());
      } else {
        print(obj.toString());
      }
    }
  }
}
