// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryDetailViewModel on _CategoryDetailViewModelBase, Store {
  final _$tabWidthsAtom = Atom(name: '_CategoryDetailViewModelBase.tabWidths');

  @override
  List<double> get tabWidths {
    _$tabWidthsAtom.reportRead();
    return super.tabWidths;
  }

  @override
  set tabWidths(List<double> value) {
    _$tabWidthsAtom.reportWrite(value, super.tabWidths, () {
      super.tabWidths = value;
    });
  }

  final _$selectedTabAtom =
      Atom(name: '_CategoryDetailViewModelBase.selectedTab');

  @override
  int get selectedTab {
    _$selectedTabAtom.reportRead();
    return super.selectedTab;
  }

  @override
  set selectedTab(int value) {
    _$selectedTabAtom.reportWrite(value, super.selectedTab, () {
      super.selectedTab = value;
    });
  }

  final _$inputHeightAtom =
      Atom(name: '_CategoryDetailViewModelBase.inputHeight');

  @override
  double get inputHeight {
    _$inputHeightAtom.reportRead();
    return super.inputHeight;
  }

  @override
  set inputHeight(double value) {
    _$inputHeightAtom.reportWrite(value, super.inputHeight, () {
      super.inputHeight = value;
    });
  }

  final _$_CategoryDetailViewModelBaseActionController =
      ActionController(name: '_CategoryDetailViewModelBase');

  @override
  void changeSelectTab2(dynamic item) {
    final _$actionInfo = _$_CategoryDetailViewModelBaseActionController
        .startAction(name: '_CategoryDetailViewModelBase.changeSelectTab2');
    try {
      return super.changeSelectTab2(item);
    } finally {
      _$_CategoryDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectedTab(int index, bool isTab) {
    final _$actionInfo = _$_CategoryDetailViewModelBaseActionController
        .startAction(name: '_CategoryDetailViewModelBase.changeSelectedTab');
    try {
      return super.changeSelectedTab(index, isTab);
    } finally {
      _$_CategoryDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabWidths: ${tabWidths},
selectedTab: ${selectedTab},
inputHeight: ${inputHeight}
    ''';
  }
}
