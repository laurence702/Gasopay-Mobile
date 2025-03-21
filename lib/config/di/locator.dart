import 'package:get_it/get_it.dart';
import 'package:project_wee/utils/service/auth_service.dart';

final GetIt getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<AuthService>(() => AuthService());
}
