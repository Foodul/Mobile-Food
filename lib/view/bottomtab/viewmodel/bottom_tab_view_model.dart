import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodul/view/categories/view/categories_view.dart';
import 'package:foodul/view/profil/view/profil_view.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/src/provider.dart';

import '../../../core/base/viewmodel/base_view_model.dart';
import '../../home/view/home_view.dart';

part 'bottom_tab_view_model.g.dart';

class BottomTabViewModel = _BottomTabViewModelBase with _$BottomTabViewModel;

abstract class _BottomTabViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  Object? paramsData;

  @override
  void init() {
    // context!
    //     .watch<BottomNavigationNotifier>()
    //     .barStream
    //     .listen((BottomNavigationNotifierModel value) {
    //   if (value.data != null) {
    //     setTabs(value.index, value.data);
    //   }
    //   tabIndex = value.index;
    // });
  }

  @observable
  ObservableList<Widget> tabs = ObservableList.of([
    const HomeView(),
    const CategoriesView(),
    const SizedBox(),
    const SizedBox(),
    const ProfileView(),
  ]);

  // @action
  // setTabs(int tabIndex, data) {
  //   if (tabIndex == BotomNavigationPage.HOME.index) {
  //     tabs[tabIndex] = const HomeView();
  //   }
  //   if (tabIndex == BotomNavigationPage.SUGGESTIONS.index) {
  //     tabs[tabIndex] = SuggestionsView(
  //       dataProp: data,
  //     );
  //   }
  //   if (tabIndex == BotomNavigationPage.NOTIFICATIONS.index) {
  //     tabs[tabIndex] = const NotificationsView();
  //   }
  //   if (tabIndex == BotomNavigationPage.PROFIL.index) {
  //     tabs[tabIndex] = const ProfileView();
  //   }
  // }

  @observable
  int tabIndex = 0;

  @action
  void changeTabIndex(index) {
    tabIndex = index;
  }
}
