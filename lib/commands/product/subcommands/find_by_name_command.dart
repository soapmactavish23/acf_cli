// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

import 'package:acf_cli/repositories/product/product_repository_impl.dart';

class FindByNameCommand extends Command {
  final ProductRepositoryImpl repository;

  FindByNameCommand({
    required this.repository,
  });

  @override
  String get description => 'Find By Name';

  @override
  String get name => 'findByName';

  @override
  FutureOr? run() async {
    print('Digite o nome: ');
    final name = stdin.readLineSync();
    if (name == null || name == '') {
      print('Preencha o campo');
    } else {
      final response = await repository.findByName(name);
      print(response.toString());
    }
  }
}
