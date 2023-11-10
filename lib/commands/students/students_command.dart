import 'package:acf_cli/commands/students/subcommands/find_all_command.dart';
import 'package:acf_cli/commands/students/subcommands/find_by_id_command.dart';
import 'package:acf_cli/repositories/student/student_repository_impl.dart';
import 'package:args/command_runner.dart';

class StudentsCommand extends Command {
  @override
  String get description => 'Students Operations';

  @override
  String get name => 'students';

  StudentsCommand() {
    final repository = StudentRepositoryImpl();
    addSubcommand(FindAllCommand(repository: repository));
    addSubcommand(FindByIdCommand(repository: repository));
  }
}
