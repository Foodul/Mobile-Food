import 'package:flutter/material.dart';
import 'package:foodul/core/base/viewmodel/base_view_model.dart';
import 'package:mobx/mobx.dart';

import '../../../core/constants/image/image_constants.dart';
import '../model/tips_detail_model.dart';
part 'tips_detail_view_model.g.dart';

class TipsDetailViewModel = _TipsDetailViewModelBase with _$TipsDetailViewModel;

abstract class _TipsDetailViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}
  @observable
  List<TipsDetailModel> data = [
    TipsDetailModel(
      photos: [ImageConstants.instance.beef, ImageConstants.instance.krep],
      mainText: 'Ways to be Healthy',
      title: 'You Bought It, You Eat It – Don’t Waste Food',
      text:
          '''We’ve become accustomed to having food from all over the world, without regard to what’s in season where we live and work, thanks to our global food supply. But in fact, it IS a problem.
Eating seasonally and regionally as much as possible means that the food you consume will travel fewer miles to get to your plate. You can feel less guilty about your coffee and chocolate from faraway continents if you’re not also consuming fossil fuel-drenched fruits and vegetables. Sticking to seasonal and regional also means it’s more likely that you are eating whole, unprocessed foods (see tip #5) that will be fresher, more flavorful and sometimes more nutritious than food chosen and picked based on its ability to withstand long distance transport. What You Can Do:
Become aware of the food you are wasting.;
Make an effort to use the food you have before purchasing more. 
Find creative uses for slightly overripe food items – some fruits can be frozen before they have gone bad and then baked or blended when you have the time (think: fruit smoothies, banana bread, berry crisp).
If you eat out, order only what you can eat – or bring home excess portions for another meal.
The CO2i emissions associated with the container are far less than those associated with the food.
Start composting! Check out the EPA’s Guide to Starting Your Own Composting Pile.''',
    ),
  ];
}
