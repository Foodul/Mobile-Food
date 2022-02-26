import 'package:flutter/material.dart';
import 'package:foodul/view/login/view/login_view.dart';
import '../../../view/splash/view/splash_view.dart';
// import 'package:oneri_sistemi_mobile/view/profil_edit/view/profil_edit_view.dart';
// import 'package:oneri_sistemi_mobile/view/profile/view/profile_view.dart';
// import 'package:oneri_sistemi_mobile/view/report/view/report_view.dart';
// import 'package:oneri_sistemi_mobile/view/change_password/view/change_password_view.dart';
// import '../../../view/similar_suggestion/model/suggest_create_model.dart';
// import '../../../view/suggestion_control/model/suggestion_control_model.dart';
// import '../../../view/suggestion_control/view/suggestion_control_view.dart';
// import '../../../view/change_password/view/change_password_view.dart';
// import '../../../view/home/view/home_view.dart';
// import '../../../view/similar_suggestion/view/similar_suggestion_view.dart';
// import '../../../view/suggestion_detail/view/suggestion_detail_view.dart';
// import '../../../view/assignment/view/assignment_view.dart';
// import '../../../view/form/view/form_view.dart';
// import '../../../view/bottomtab/view/bottom_tab_view.dart';
// import '../../../view/errors/something_went_wrong_view.dart';
// import '../../../view/login/view/login_view.dart';
// import '../../../view/onboard/onboard_view.dart';
// import '../../../view/splash/view/splash_view.dart';
// import '../../../view/suggestion_register/view/suggestion_register_view.dart';
import '../../../view/test/view/test_view.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView());
      case NavigationConstants.LOGIN:
        return normalNavigate(const LoginView());

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
