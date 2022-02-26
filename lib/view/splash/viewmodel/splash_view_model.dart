// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:kartal/kartal.dart';
// import 'package:mobx/mobx.dart';
// import 'package:oneri_sistemi_mobile/core/init/firebase/firebase_config.dart';
// import 'package:provider/src/provider.dart';

// import '../../../../core/base/viewmodel/base_view_model.dart';
// import '../../../../core/constants/navigation/navigation_constants.dart';
// import '../../../../core/init/cache/locale_manager.dart';
// import '../../../core/constants/enums/preferences_keys_enum.dart';
// import '../../../core/init/notifier/init_notifier.dart';
// import '../../login/model/init_model.dart';
// import '../service/i_splash_service.dart';
// import '../service/splash_service.dart';

// part 'splash_view_model.g.dart';

// class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

// abstract class _SplashViewModelBase with Store, BaseViewModel {
//   @override
//   void setContext(BuildContext context) => this.context = context;

//   late ISplashService splashService;

//   @override
//   Future<void> init() async {
//     WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
//       controlAppState();
//     });

//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     await messaging.requestPermission();
//     var token = await messaging.getToken();
//     print('TOKEN');
//     print(token);

//     splashService = SplashService(vexanaManager.networkManager);
//   }

//   Future<void> controlAppState() async {
//     await Future.wait([
//       LocaleManager.prefrencesInit(),
//       DeviceUtility.instance.initPackageInfo()
//     ]);

//     await Future.delayed(context!.durationNormal);
//     await Future.delayed(context!.durationNormal);

//     if (localeManager.getStringValue(PreferencesKeys.TOKEN).isEmpty) {
//       if (!localeManager.getBoolValue(PreferencesKeys.IS_FIRST_APP)) {
//         await navigation.navigateToPageClear(
//             path: NavigationConstants.ON_BOARD);
//       } else {
//         await navigation.navigateToPageClear(path: NavigationConstants.LOGIN);
//       }
//     } else {
//       final initResponse = await splashService.fetchInit();
//       if (initResponse!.type == true) {
//         InitModel initModel = initResponse.data;
//         context!.read<InitNotifier>().setInit(initModel.toJson());
//         await navigation.navigateToPageClear(
//             path: NavigationConstants.BOTTOM_TAB);
//       } else {
//         await navigation.navigateToPageClear(path: NavigationConstants.WRONG);
//       }
//     }
//   }
// }

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
// }
