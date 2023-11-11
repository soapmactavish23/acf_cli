import 'package:acf_cli/commands/product/product_command.dart';
import 'package:acf_cli/commands/students/students_command.dart';
import 'package:acf_cli/commands/user/user_command.dart';
import 'package:args/command_runner.dart';

void main(List<String> arguments) {
  CommandRunner('ADF CLI', 'ADF CLI')
    ..addCommand(StudentsCommand())
    ..addCommand(ProductCommand())
    ..addCommand(UserCommand())
    ..run(arguments);
}
