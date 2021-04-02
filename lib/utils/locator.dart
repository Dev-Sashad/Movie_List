import 'package:get_it/get_it.dart';
import 'package:movie_download_app/core/services/api_service.dart';
import 'package:movie_download_app/utils/router/navigation_service.dart';

import 'progressBarManager/dialogService.dart';


GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ProgressService());
  locator.registerLazySingleton(() => MovieApiService());
}
