// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yeka/provider/auth_provider.dart';
import 'package:yeka/provider/community_freeboard_provider.dart';
import 'package:yeka/provider/community_notice_provider.dart';
import 'package:yeka/provider/community_provider.dart';
import 'package:yeka/provider/community_youtube_provider.dart';
import 'package:yeka/provider/consulting_provider.dart';
import 'package:yeka/provider/like_product_provider.dart';
import 'package:yeka/provider/localization_provider.dart';
import 'package:yeka/provider/menu_provider.dart';
import 'package:yeka/provider/onboarding_provider.dart';
import 'package:yeka/provider/option_provider.dart';
import 'package:yeka/provider/order_provider.dart';
import 'package:yeka/provider/personal_color_provider.dart';
import 'package:yeka/provider/product_provider.dart';
import 'package:yeka/provider/splash_provider.dart';
import 'package:yeka/provider/theme_provider.dart';
import 'package:yeka/provider/user_provider.dart';
import 'package:yeka/provider/image_provider.dart';
import 'package:yeka/theme/dark_theme.dart';
import 'package:yeka/theme/light_theme.dart';
import 'package:yeka/util/app_constants.dart';
import 'package:yeka/view/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'di_container.dart' as di;
import 'helper/custom_delegate.dart';
import 'localization/app_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
  await di.init();
  int _orderID;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<OnBoardingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<LocalizationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ConsultingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<UserProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CommunityProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CommunityNoticeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CommunityYoutubeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CommunityFreeBoardProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<OptionProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<MenuProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CustomImageProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ProductProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<LikeProductProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<OrderProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<PersonalColorProvider>()),
    ],
    child: MyApp(orderId: _orderID),
  ));
}

class MyApp extends StatelessWidget {
  final int orderId;
  MyApp({@required this.orderId});

  static final navigatorKey = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    List<Locale> _locals = [];
    AppConstants.languages.forEach((language) {
      _locals.add(Locale(language.languageCode, language.countryCode));
    });
    return MaterialApp(
      title: AppConstants.APP_NAME,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
      locale: Provider.of<LocalizationProvider>(context).locale,
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackLocalizationDelegate()
      ],
      supportedLocales: _locals,
      home: SplashScreen(),
    );
  }
}
