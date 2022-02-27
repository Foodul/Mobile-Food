// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  final _$isPasswordLockedAtom =
      Atom(name: '_LoginViewModelBase.isPasswordLocked');

  @override
  bool get isPasswordLocked {
    _$isPasswordLockedAtom.reportRead();
    return super.isPasswordLocked;
  }

  @override
  set isPasswordLocked(bool value) {
    _$isPasswordLockedAtom.reportWrite(value, super.isPasswordLocked, () {
      super.isPasswordLocked = value;
    });
  }

  final _$submitAsyncAction = AsyncAction('_LoginViewModelBase.submit');

  @override
  Future submit() {
    return _$submitAsyncAction.run(() => super.submit());
  }

  final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase');

  @override
  dynamic changePasswordLocked() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.changePasswordLocked');
    try {
      return super.changePasswordLocked();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordLocked: ${isPasswordLocked}
    ''';
  }
}
