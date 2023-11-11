// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:args/command_runner.dart';

import 'package:acf_cli/repositories/user/user_repository_impl.dart';

class FindAllCommandUser extends Command {

  @override
  String get description => 'Find All';

  @override
  String get name => 'findAll';

  final UserRepositoryImpl repository;
  
  FindAllCommandUser({
    required this.repository,
  });

  @override
  FutureOr? run()  async {
    final response = await repository.findAll();
    print('--------------------------------');
    print(response.toString());
  }

}
