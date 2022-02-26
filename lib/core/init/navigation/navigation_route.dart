import 'package:flutter/material.dart';
import 'package:foodul/view/camera/view/camera_view.dart';
import 'package:foodul/view/food_detail/view/food_detail_view.dart';
import 'package:foodul/view/login/view/login_view.dart';
import '../../../view/splash/view/splash_view.dart';

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
      case NavigationConstants.CAMERA:
        return normalNavigate(const CameraView());
      case NavigationConstants.FOOD_DETAIL:
        final String filePath = args.arguments as String;
        return normalNavigate(FoodDetailView(
          filePath: filePath,
        ));
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
