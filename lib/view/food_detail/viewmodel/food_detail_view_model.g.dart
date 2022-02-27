// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FoodDetailViewModel on _FoodDetailViewModelBase, Store {
  Computed<dynamic>? _$getTypeDropdownComputed;

  @override
  dynamic get getTypeDropdown => (_$getTypeDropdownComputed ??=
          Computed<dynamic>(() => super.getTypeDropdown,
              name: '_FoodDetailViewModelBase.getTypeDropdown'))
      .value;

  final _$isLoadingAtom = Atom(name: '_FoodDetailViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$labelAtom = Atom(name: '_FoodDetailViewModelBase.label');

  @override
  String get label {
    _$labelAtom.reportRead();
    return super.label;
  }

  @override
  set label(String value) {
    _$labelAtom.reportWrite(value, super.label, () {
      super.label = value;
    });
  }

  final _$typeValueAtom = Atom(name: '_FoodDetailViewModelBase.typeValue');

  @override
  String get typeValue {
    _$typeValueAtom.reportRead();
    return super.typeValue;
  }

  @override
  set typeValue(String value) {
    _$typeValueAtom.reportWrite(value, super.typeValue, () {
      super.typeValue = value;
    });
  }

  final _$typeAtom = Atom(name: '_FoodDetailViewModelBase.type');

  @override
  List<dynamic> get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(List<dynamic> value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$_FoodDetailViewModelBaseActionController =
      ActionController(name: '_FoodDetailViewModelBase');

  @override
  void changeIsLoading() {
    final _$actionInfo = _$_FoodDetailViewModelBaseActionController.startAction(
        name: '_FoodDetailViewModelBase.changeIsLoading');
    try {
      return super.changeIsLoading();
    } finally {
      _$_FoodDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWorkFlowTextValue(dynamic value) {
    final _$actionInfo = _$_FoodDetailViewModelBaseActionController.startAction(
        name: '_FoodDetailViewModelBase.setWorkFlowTextValue');
    try {
      return super.setWorkFlowTextValue(value);
    } finally {
      _$_FoodDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
label: ${label},
typeValue: ${typeValue},
type: ${type},
getTypeDropdown: ${getTypeDropdown}
    ''';
  }
}
