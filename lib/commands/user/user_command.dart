import 'package:acf_cli/commands/user/subcommands/find_by_id_command_user.dart';
import 'package:acf_cli/repositories/user/user_repository_impl.dart';
import 'package:args/command_runner.dart';
import 'package:acf_cli/commands/user/subcommands/find_all_command_user.dart';

class UserCommand extends Command {
  @override

  String get description => 'User Operations';

  @override
  String get name => 'users';

  UserCommand() {
    final repository = UserRepositoryImpl();
    addSubcommand(FindAllCommandUser(repository: repository));
    addSubcommand(FindByIdCommandUser(repository: repository));
  }
  
}