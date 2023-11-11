
import 'dart:async';
import 'dart:io';

import 'package:acf_cli/models/user.dart';
import 'package:acf_cli/repositories/user/user_repository_impl.dart';
import 'package:args/command_runner.dart';

class UpdateUserCommand extends Command {
  @override
  String get description => 'Update User';

  @override
  String get name => 'update';

  final UserRepositoryImpl repository;

  UpdateUserCommand({required this.repository});

  @override
  FutureOr? run() async {
    print('Digite o ID: ');
    final id = stdin.readLineSync();
    if(id == null || id == '') {
      throw Exception('ID é obrigatório');
    }
    print('Digite o nome: ');
    final name = stdin.readLineSync();
    if(name == null || name == '') {
      throw Exception('Nome é obrigatório');
    }
    print('Digite o e-mail: ');
    final email = stdin.readLineSync();
    if(email == null || email == '') {
      throw Exception('E-mail é obrigatório');
    }
    print('Digite a senha: ');
    final password = stdin.readLineSync();
    if(password == null || password == ''){
      throw Exception('Senha é obrigatória');
    }
    
    final obj = User(id: int.parse(id), name: name, email: email, password: password);
    await repository.update(obj);
    print('Atualizado com sucesso!');
  }
  
}