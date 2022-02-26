import 'package:flutter/material.dart';
import 'package:foodul/core/base/viewmodel/base_view_model.dart';

import 'package:mobx/mobx.dart';
part 'categories_view_model.g.dart';

class CategoriesViewModel = _CategoriesViewModelBase with _$CategoriesViewModel;

abstract class _CategoriesViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
