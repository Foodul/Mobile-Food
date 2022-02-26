// import 'package:oneri_sistemi_mobile/core/init/notifier/bottom_navigation_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../navigation/navigation_service.dart';
import 'init_notifier.dart';
import 'theme_notifer.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
    ),
    Provider.value(value: NavigationService.instance),
    ChangeNotifierProvider(
      create: (context) => InitNotifier(),
    ),
    // ChangeNotifierProvider(
    //   create: (context) => BottomNavigationNotifier(),
    // ),
  ];
  List<SingleChildWidget> uiChangesItems = [];
}
