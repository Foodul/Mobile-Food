// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profil_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfilViewModel on _ProfilViewModelBase, Store {
  final _$tabsSelectIndexAtom =
      Atom(name: '_ProfilViewModelBase.tabsSelectIndex');

  @override
  int get tabsSelectIndex {
    _$tabsSelectIndexAtom.reportRead();
    return super.tabsSelectIndex;
  }

  @override
  set tabsSelectIndex(int value) {
    _$tabsSelectIndexAtom.reportWrite(value, super.tabsSelectIndex, () {
      super.tabsSelectIndex = value;
    });
  }

  final _$_ProfilViewModelBaseActionController =
      ActionController(name: '_ProfilViewModelBase');

  @override
  dynamic changeTabSelect(dynamic value) {
    final _$actionInfo = _$_ProfilViewModelBaseActionController.startAction(
        name: '_ProfilViewModelBase.changeTabSelect');
    try {
      return super.changeTabSelect(value);
    } finally {
      _$_ProfilViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabsSelectIndex: ${tabsSelectIndex}
    ''';
  }
}
