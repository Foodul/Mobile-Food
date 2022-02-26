import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodul/core/base/viewmodel/base_view_model.dart';
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
    final response = await auth.signInWithEmailAndPassword(
        email: 'test@test.com', password: 'test123');
    inspect(response);
  }
}
