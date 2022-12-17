import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/repository/community_repo.dart';
import 'package:yeka/data/repository/consulting_repo.dart';
import 'package:yeka/data/repository/image_repo.dart';
import 'package:yeka/data/repository/like_community_repo.dart';
import 'package:yeka/data/repository/menu_repo.dart';
import 'package:yeka/data/repository/notification_repo.dart';
import 'package:yeka/data/repository/onboarding_repo.dart';
import 'package:yeka/data/repository/option_repo.dart';
import 'package:yeka/data/repository/order_repo.dart';
import 'package:yeka/data/repository/personal_color_repo.dart';
import 'package:yeka/data/repository/product_repo.dart';
import 'package:yeka/data/repository/splash_repo.dart';
import 'package:yeka/data/repository/user_repo.dart';
import 'package:yeka/helper/network_info.dart';
import 'package:yeka/provider/auth_provider.dart';
import 'package:yeka/provider/community_freeboard_provider.dart';
import 'package:yeka/provider/community_notice_provider.dart';
import 'package:yeka/provider/community_provider.dart';
import 'package:yeka/provider/community_youtube_provider.dart';
import 'package:yeka/provider/consulting_provider.dart';
import 'package:yeka/provider/image_provider.dart';
import 'package:yeka/provider/like_community_provider.dart';
import 'package:yeka/provider/localization_provider.dart';
import 'package:yeka/provider/menu_provider.dart';
import 'package:yeka/provider/notification_provider.dart';
import 'package:yeka/provider/onboarding_provider.dart';
import 'package:yeka/provider/option_provider.dart';
import 'package:yeka/provider/order_provider.dart';
import 'package:yeka/provider/personal_color_provider.dart';
import 'package:yeka/provider/product_provider.dart';
import 'package:yeka/provider/splash_provider.dart';
import 'package:yeka/provider/theme_provider.dart';
import 'package:yeka/provider/user_provider.dart';
import 'package:yeka/utill/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repository/auth_repo.dart';
import 'data/repository/community_freeboard_repo.dart';
import 'data/repository/community_notice_repo.dart';
import 'data/repository/community_youtube_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => OnBoardingRepo(dioClient: sl()));
  sl.registerLazySingleton(() => NotificationRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CommunityRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => CommunityNoticeRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => CommunityYoutubeRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => CommunityFreeBoardRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => ConsultingRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => ImageRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => LikeCommunityRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => MenuRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => OptionRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => OrderRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => ProductRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => UserRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => AuthRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => PersonalColorRepo(sharedPreferences: sl(), dioClient: sl()));

  // Provider
  sl.registerFactory(() => OnBoardingProvider(onboardingRepo: sl()));
  sl.registerFactory(() => NotificationProvider(notificationRepo: sl()));
  sl.registerFactory(() => SplashProvider(splashRepo: sl()));
  sl.registerFactory(() => LocalizationProvider(sharedPreferences: sl(), dioClient: sl()));
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => CommunityProvider(communityRepo: sl()));
  sl.registerFactory(() => CommunityNoticeProvider(communityRepo: sl()));
  sl.registerFactory(() => CommunityYoutubeProvider(communityRepo: sl()));
  sl.registerFactory(() => CommunityFreeBoardProvider(communityRepo: sl()));
  sl.registerFactory(() => ConsultingProvider(consultingRepo: sl()));
  sl.registerFactory(() => CustomImageProvider(imageRepo: sl()));
  sl.registerFactory(() => LikeCommunityProvider(likeCommunityRepo: sl()));
  sl.registerFactory(() => MenuProvider(menuRepo: sl()));
  sl.registerFactory(() => OptionProvider(optionRepo: sl()));
  sl.registerFactory(() => OrderProvider(orderRepo: sl()));
  sl.registerFactory(() => ProductProvider(productRepo: sl()));
  sl.registerFactory(() => UserProvider(userRepo: sl()));
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  sl.registerFactory(() => PersonalColorProvider(personalColorRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
}
