import 'package:flutter/material.dart';
import 'package:foodul/core/base/viewmodel/base_view_model.dart';
import 'package:foodul/core/constants/image/image_constants.dart';
import 'package:foodul/view/tips/model/tips_model.dart';
import 'package:mobx/mobx.dart';
part 'tips_view_model.g.dart';

class TipsViewModel = _TipsViewModelBase with _$TipsViewModel;

abstract class _TipsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  @observable
  List<TipsModel> data = [
    TipsModel(
        tipsimg: ImageConstants.instance.waste,
        title: 'You Bought It, You Eat It – Don’t Waste Food',
        info:
            'More than 4.5 million tons of food is wasted every year in the U.S. – about 25%',
        onTab: () {}),
  ];
}
