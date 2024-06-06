import 'package:flutter_application_2/core/api_service.dart';
import 'package:flutter_application_2/core/services/dio_factory.dart';
import 'package:flutter_application_2/features/auth/data/auth_repo_impl.dart';
import 'package:flutter_application_2/features/auth/domain/auth_repository.dart';
import 'package:flutter_application_2/features/home/data/repositories/moveis_repo_impl.dart';
import 'package:flutter_application_2/features/home/domain/repo/moveis_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // Register the AuthRepository
  locator.registerLazySingleton<AuthRepository>(() => AuthRepoImpl());

  // Register SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(prefs);

  // Register Api Service
  locator.registerLazySingleton(() => ApiService(createDio()));

  locator.registerLazySingleton<Moviesrepository>(
      () => MoveisRepoImpl(locator.get<ApiService>()));
}
