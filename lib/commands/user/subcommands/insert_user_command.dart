
import 'dart:async';
import 'dart:io';

import 'package:acf_cli/models/user.dart';
import 'package:acf_cli/repositories/user/user_repository_impl.dart';
import 'package:args/command_runner.dart';

class InsertUserCommand extends Command {
  @override
  String get description => 'Insert user';

  @override
  String get name => 'insert';

  final UserRepositoryImpl repository;

  InsertUserCommand({required this.repository});

  @override
  FutureOr? run() async {
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
    
    
    final obj = User(name: name, email: email, password: password);
    await repository.insert(obj);
    print('Cadastrado com sucesso!');
  }
  
}