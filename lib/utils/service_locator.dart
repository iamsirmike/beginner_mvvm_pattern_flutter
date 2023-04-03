import 'package:flutter_boilerplate_mvvm_pattern/core/services/user_service.dart';
import 'package:flutter_boilerplate_mvvm_pattern/utils/api_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => UserService(apiService: ApiService()));
}
