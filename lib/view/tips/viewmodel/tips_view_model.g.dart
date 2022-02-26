// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TipsViewModel on _TipsViewModelBase, Store {
  final _$dataAtom = Atom(name: '_TipsViewModelBase.data');

  @override
  List<TipsModel> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<TipsModel> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
