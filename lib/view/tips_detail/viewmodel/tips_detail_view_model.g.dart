// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TipsDetailViewModel on _TipsDetailViewModelBase, Store {
  final _$dataAtom = Atom(name: '_TipsDetailViewModelBase.data');

  @override
  List<TipsDetailModel> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<TipsDetailModel> value) {
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
