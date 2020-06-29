import 'package:actin/injection.iconfig.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final g = GetIt.instance;

@injectableInit
void configureInjection(String environment) =>
    $initGetIt(g, environment: environment);

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
