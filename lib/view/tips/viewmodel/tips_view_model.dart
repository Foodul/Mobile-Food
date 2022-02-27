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
      tipsImage: ImageConstants.instance.waste,
      title: 'You Bought It, You Eat It – Don’t Waste Food',
      text:
          'More than 4.5 million tons of food is wasted every year in the U.S. – about 25%',
      // onTab: () {}
    ),
    TipsModel(
      tipsImage: ImageConstants.instance.limon,
      title: 'Make “Seasonal and Regional” Your Food Mantra',
      text: 'Strawberries in winter in Vermont? No problem! We’ve become',
      // onTab: () {}
    ),
    TipsModel(
      tipsImage: ImageConstants.instance.orange,
      title: 'You Bought It, You Eat It – Don’t Waste Food',
      text:
          'More than 4.5 million tons of food is wasted every year in the U.S. – about 25%',
      // onTab: () {}
    ),
  ];
}
