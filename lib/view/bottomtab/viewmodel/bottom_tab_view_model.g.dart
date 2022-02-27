// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_tab_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomTabViewModel on _BottomTabViewModelBase, Store {
  final _$tabsAtom = Atom(name: '_BottomTabViewModelBase.tabs');

  @override
  ObservableList<Widget> get tabs {
    _$tabsAtom.reportRead();
    return super.tabs;
  }

  @override
  set tabs(ObservableList<Widget> value) {
    _$tabsAtom.reportWrite(value, super.tabs, () {
      super.tabs = value;
    });
  }

  final _$tabIndexAtom = Atom(name: '_BottomTabViewModelBase.tabIndex');

  @override
  int get tabIndex {
    _$tabIndexAtom.reportRead();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.reportWrite(value, super.tabIndex, () {
      super.tabIndex = value;
    });
  }

  final _$changeTabIndexAsyncAction =
      AsyncAction('_BottomTabViewModelBase.changeTabIndex');

  @override
  Future<void> changeTabIndex(dynamic index) {
    return _$changeTabIndexAsyncAction.run(() => super.changeTabIndex(index));
  }

  @override
  String toString() {
    return '''
tabs: ${tabs},
tabIndex: ${tabIndex}
    ''';
  }
}
