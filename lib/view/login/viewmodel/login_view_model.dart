import 'package:flutter/material.dart';
import 'package:foodul/core/base/viewmodel/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isPasswordLocked = false;

  @action
  changePasswordLocked() => isPasswordLocked = !isPasswordLocked;

  @action
  submit() {
    print('submit');
  }
}
