import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';
// import 'package:oneri_sistemi_mobile/core/init/firebase/firebase_config.dart';
import 'package:provider/src/provider.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../core/init/notifier/init_notifier.dart';
// import '../../login/model/init_model.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controlAppState();
    });
  }

  Future<void> controlAppState() async {
    await Future.wait([
      LocaleManager.prefrencesInit(),
      DeviceUtility.instance.initPackageInfo()
    ]);

    await Future.delayed(context!.durationNormal);
    await Future.delayed(context!.durationNormal);

    if (localeManager.getStringValue(PreferencesKeys.TOKEN).isEmpty) {
      if (!localeManager.getBoolValue(PreferencesKeys.IS_FIRST_APP)) {
        await navigation.navigateToPageClear(path: NavigationConstants.CAMERA);
      } else {
        await navigation.navigateToPageClear(path: NavigationConstants.LOGIN);
      }
    } else {
      await navigation.navigateToPageClear(path: NavigationConstants.CAMERA);
    }
  }
}
