import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodul/view/categories/model/categories_model.dart';
import 'package:foodul/view/categories/view/categories_view.dart';
import 'package:foodul/view/category_details/model/category_detail_model.dart';
import 'package:foodul/view/category_details/view/category_detail.dart';
import 'package:foodul/view/bottomtab/view/bottom_tab_view.dart';
import 'package:foodul/view/home/view/home_view.dart';
import 'package:foodul/view/login/view/login_view.dart';
import 'package:foodul/view/onboard/view/onboard_view.dart';
import '../../../view/splash/view/splash_view.dart';
import '../../../view/test/view/test_view.dart';
import '../../../view/tips_detail/view/tips_detail_view.dart';
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
      case NavigationConstants.TIPS_DETAIL:
        return normalNavigate(const TipsDetailView());
      case NavigationConstants.HOME:
        return normalNavigate(const HomeView());
      case NavigationConstants.CATEGORIES:
        return normalNavigate(const CategoriesView());
      case NavigationConstants.CATEGORIES_DETAIL:
        final model = args.arguments as CategoriesModel;
        return normalNavigate(CategoryDetailView(
          data: model,
        ));
      case NavigationConstants.BOTTOM_TAB:
        return normalNavigate(const BottomTabView());
      case NavigationConstants.ON_BOARD:
        return normalNavigate(const OnboardView());
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
