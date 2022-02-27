import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodul/view/bottomtab/view/bottom_tab_view.dart';
import 'package:foodul/view/categories/view/categories_view.dart';
import 'package:foodul/view/category_details/view/category_detail.dart';
import 'package:foodul/view/home/view/home_view.dart';
import 'package:foodul/view/login/view/login_view.dart';
import 'package:foodul/view/onboard/view/onboard_enter_view.dart';
import 'package:foodul/view/onboard/view/onboard_view.dart';
import 'package:foodul/view/tips/view/tips_view.dart';
import 'package:foodul/view/profil/view/profil_view.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
// import 'core/init/analytics/analytics_manager.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifer.dart';

Future<void> main() async {
  await _init();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
      child: MyApp(),
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: AppConstants.LANG_ASSET_PATH,
      startLocale: LanguageManager.instance.enLocale,
    ),
  ));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardEnterView(),
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      // navigatorObservers: AnalytcisManager.instance.observer,
    );
  }
}
