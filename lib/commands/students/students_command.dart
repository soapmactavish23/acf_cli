import 'package:acf_cli/commands/students/subcommands/delete_command.dart';
import 'package:acf_cli/commands/students/subcommands/find_all_command.dart';
import 'package:acf_cli/commands/students/subcommands/find_by_id_command.dart';
import 'package:acf_cli/commands/students/subcommands/insert_command.dart';
import 'package:acf_cli/commands/students/subcommands/update_command.dart';
import 'package:acf_cli/repositories/student/student_dio_repository.dart';
import 'package:args/command_runner.dart';

class StudentsCommand extends Command {
  @override
  String get description => 'Students Operations';

  @override
  String get name => 'students';

  StudentsCommand() {
    final repository = StudentDioRepository();
    addSubcommand(FindAllCommand(repository: repository));
    addSubcommand(FindByIdCommand(repository: repository));
    addSubcommand(InsertCommand(repository));
    addSubcommand(UpdateCommand(repository: repository));
    addSubcommand(DeleteCommand(repository: repository));
  }
}
