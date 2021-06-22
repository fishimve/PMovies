import 'package:get_it/get_it.dart';

import './services/api_service.dart';
import './services/navigation_service.dart';

var locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => NavigationService());

}
