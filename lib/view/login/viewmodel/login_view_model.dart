import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodul/core/base/viewmodel/base_view_model.dart';
import 'package:foodul/core/constants/enums/preferences_keys_enum.dart';
import 'package:foodul/core/constants/navigation/navigation_constants.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  late FirebaseAuth auth;
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    // FirebaseApp.configure();
    auth = FirebaseAuth.instance;
  }

  @observable
  bool isPasswordLocked = false;

  @action
  changePasswordLocked() => isPasswordLocked = !isPasswordLocked;

  @action
  submit() async {
    if (emailController!.text.isNotEmpty &&
        passwordController!.text.isNotEmpty) {
      try {
        final response = await auth.signInWithEmailAndPassword(
            email: emailController!.text, password: passwordController!.text);
        if (response.user?.uid != null) {
          await localeManager.setStringValue(
              PreferencesKeys.TOKEN, response.user!.uid);
          // await navigation.navigateToPageClear(
          //   path: NavigationConstants.BOTTOM_TAB,
          // );
        }
      } on FirebaseException catch (e) {
        showMessage(message: e.message);
      }
    }
  }
}
