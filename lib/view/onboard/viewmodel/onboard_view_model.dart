import 'dart:async';

import 'package:flutter/material.dart';
import '../../../core/base/viewmodel/base_view_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/image/image_constants.dart';

part 'onboard_view_model.g.dart';

class OnboardViewModel = _OnboardViewModelBase with _$OnboardViewModel;

abstract class _OnboardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    pageController = PageController(
      initialPage: 0,
    );
    changePage();
  }

  List<String> onBoardItems = [
    ImageConstants.instance.onBoard1,
    ImageConstants.instance.onBoard2,
    ImageConstants.instance.onBoard3,
  ];

  List<String> onBoardTitle = [
    'Learn About\nLow Carbon\nFoods',
    'Take Photos\nand View\nDetails',
    'Display Carbon\nValues and\nCalories',
  ];

  late PageController pageController;

  @observable
  bool isLoading = false;

  @observable
  int currentIndex = 0;

  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @observable
  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    changeLoading();
    // await navigation.navigateToPageClear(path: NavigationConstants.LOGIN);
  }

  void changePage() {
    Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      currentIndex++;
      currentIndex = currentIndex % onBoardItems.length;
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }
}
