import 'package:flutter/material.dart';
import 'package:foodul/view/home/view/home_view.dart';
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
      case NavigationConstants.HOME:
        return normalNavigate(const HomeView());
      // case NavigationConstants.TEST:
      //   return normalNavigate(const TestView());
      // case NavigationConstants.ON_BOARD:
      //   return normalNavigate(const OnboardView());
      // case NavigationConstants.LOGIN:
      //   return normalNavigate(const LoginView());
      // case NavigationConstants.SUGGESTION_DETAIL:
      //   final id = args.arguments as String;
      //   return normalNavigate(SuggestionDetailView(id: id));
      // case NavigationConstants.HOME:
      //   return normalNavigate(const HomeView());
      // case NavigationConstants.BOTTOM_TAB:
      //   return normalNavigate(const BottomTabView());
      // case NavigationConstants.SUGGESTION_REGISTER:
      //   return normalNavigate(const SuggestionRegisterView());
      // case NavigationConstants.SIMILAR_SUGGESTIONS:
      //   final model = args.arguments as SuggestCreateModel;
      //   return normalNavigate(SimilarSuggestionsView(
      //     suggestionControlModel: model,
      //   ));
      // case NavigationConstants.FORM_VIEW:
      //   final id = args.arguments as String;
      //   return normalNavigate(FormView(id: id));
      // case NavigationConstants.ASSIGNMENT_USER:
      //   final id = args.arguments as String;
      //   return normalNavigate(AssignmentView(id: id));
      // case NavigationConstants.PROFIL_EDIT:
      //   return normalNavigate(ProfilEditView(
      //     data: args.arguments,
      //   ));
      // case NavigationConstants.PROFIL:
      //   return normalNavigate(const ProfileView());
      // case NavigationConstants.REPORT:
      //   return normalNavigate(const ReportView());

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
