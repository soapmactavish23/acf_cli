import 'package:acf_cli/commands/product/subcommands/find_by_name_command.dart';
import 'package:acf_cli/repositories/product/product_repository_impl.dart';
import 'package:args/command_runner.dart';

class ProductCommand extends Command {
  @override
  String get description => 'Products Operations';

  @override
  String get name => 'product';

  ProductCommand() {
    final repository = ProductRepositoryImpl();
    addSubcommand(FindByNameCommand(repository: repository));
  }
}
