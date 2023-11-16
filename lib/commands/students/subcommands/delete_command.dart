// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:acf_cli/repositories/student/student_dio_repository.dart';
import 'package:args/command_runner.dart';

class DeleteCommand extends Command {
  StudentDioRepository repository;
  @override
  String get description => 'Delete By Id';

  @override
  String get name => 'delete';

  DeleteCommand({required this.repository}) {
    argParser.addOption('id', help: 'Student ID', abbr: 'i');
  }

  @override
  FutureOr? run() async {
    if (argResults?['id'] == null) {
      print('por favor envie o id com um comando --id={id} ou -i {id}');
      return;
    }
    final id = argResults?['id'];
    print('Deseja realmente excluir o estudante? (S / N)');
    final confirmDelete = stdin.readLineSync();
    if (confirmDelete?.toLowerCase() == 's') {
      await repository.deleteById(int.parse(id));
      print('Estudante excluido com sucesso!');
      return;
    } else {
      print('Exclusão cancelada');
      return;
    }
  }
}
