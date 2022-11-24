import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:byher/data/datasource/remote/dio/dio_client.dart';
import 'package:byher/data/repository/banner_repo.dart';
import 'package:byher/data/repository/notification_repo.dart';
import 'package:byher/data/repository/onboarding_repo.dart';
import 'package:byher/data/repository/process_repo.dart';
import 'package:byher/data/repository/splash_repo.dart';
import 'package:byher/helper/network_info.dart';
import 'package:byher/provider/banner_provider.dart';
import 'package:byher/provider/car_provider.dart';
import 'package:byher/provider/chat_provider.dart';
import 'package:byher/provider/clients_provider.dart';
import 'package:byher/provider/localization_provider.dart';
import 'package:byher/provider/notification_provider.dart';
import 'package:byher/provider/onboarding_provider.dart';
import 'package:byher/provider/process_provider.dart';
import 'package:byher/provider/request_provider.dart';
import 'package:byher/provider/review_provider.dart';
import 'package:byher/provider/splash_provider.dart';
import 'package:byher/provider/theme_provider.dart';
import 'package:byher/utill/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repository/car_repo.dart';
import 'data/repository/clients_repo.dart';
import 'data/repository/request_repo.dart';
import 'data/repository/review_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => BannerRepo(dioClient: sl()));
  sl.registerLazySingleton(() => OnBoardingRepo(dioClient: sl()));
  // sl.registerLazySingleton(() => ChatRepo(dioClient: sl()));
  sl.registerLazySingleton(() => NotificationRepo(dioClient: sl()));
  sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => ClientsRepo(dioClient: sl(), sharedPreferences: sl(),));
  sl.registerLazySingleton(() => ProcessRepo(dioClient: sl(), sharedPreferences: sl(),));
  sl.registerLazySingleton(() => RequestRepo(dioClient: sl(), sharedPreferences: sl(),));
  sl.registerLazySingleton(() => ReviewRepo(dioClient: sl(), sharedPreferences: sl(),));
  sl.registerLazySingleton(() => CarRepo(dioClient: sl(), sharedPreferences: sl(),));

  // Provider
  sl.registerFactory(() => BannerProvider(bannerRepo: sl()));
  sl.registerFactory(() => OnBoardingProvider(onboardingRepo: sl()));
  sl.registerFactory(() => ChatProvider(chatRepo: sl()));
  sl.registerFactory(() => NotificationProvider(notificationRepo: sl()));
  sl.registerFactory(() => SplashProvider(splashRepo: sl()));
  sl.registerFactory(() => LocalizationProvider(sharedPreferences: sl(), dioClient: sl()));
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => ClientsProvider(clientsRepo: sl(), processRepo: sl(), requestRepo: sl()));
  sl.registerFactory(() => ProcessProvider(processRepo: sl()));
  sl.registerFactory(() => RequestProvider(requestRepo: sl()));
  sl.registerFactory(() => ReviewProvider(reviewRepo: sl()));
  sl.registerFactory(() => CarProvider(carRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
}
