// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:args/command_runner.dart';

import 'package:acf_cli/repositories/student/student_repository_impl.dart';

class FindByIdCommand extends Command {
  final StudentRepositoryImpl repository;
  FindByIdCommand({
    required this.repository,
  }) {
    argParser.addOption('id', help: 'Student ID', abbr: 'i');
  }

  @override
  String get description => 'Find By Id';

  @override
  String get name => 'byId';

  @override
  FutureOr? run() async {
    if (argResults?['id'] == null) {
      print('por favor envie o id com um comando --id={id} ou -i {id}');
    } else {
      print('Aguarde buscando alunos...');
      final id = int.parse(argResults?['id']);
      final obj = await repository.findById(id);
      print('----------------------------------');
      print('Aluno:');
      print('----------------------------------');
      print(obj.toString());
    }
  }
}
