import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class AppPath {
  final String path;

  AppPath(this.path);
}

@module
abstract class AppPathModule {
  @preResolve
  Future<AppPath> getAppPath() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    return AppPath(appDocumentDir.path);
  }
}
