import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodul/core/base/viewmodel/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'food_detail_view_model.g.dart';

class FoodDetailViewModel = _FoodDetailViewModelBase with _$FoodDetailViewModel;

abstract class _FoodDetailViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
    ]);
  }
}
