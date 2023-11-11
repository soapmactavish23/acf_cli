// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

import 'package:acf_cli/repositories/user/user_repository_impl.dart';

class FindByIdCommandUser extends Command {
  @override
  String get description => 'Find By Id';

  @override
  String get name => 'findById';

  final UserRepositoryImpl repository;

  FindByIdCommandUser({
    required this.repository,
  });

  @override
  FutureOr? run() async {
    print('Digite o ID: ');
    final id = stdin.readLineSync();
    if(id == null){
      throw Exception("Preencha um número válido");
    } else {
      final response = await repository.findById(int.parse(id));
      print(response);
    }
  }
  
}
