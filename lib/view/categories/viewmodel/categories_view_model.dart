import 'package:flutter/material.dart';
import 'package:foodul/core/base/viewmodel/base_view_model.dart';
import 'package:foodul/view/categories/model/categories_model.dart';

import 'package:mobx/mobx.dart';
part 'categories_view_model.g.dart';

class CategoriesViewModel = _CategoriesViewModelBase with _$CategoriesViewModel;

abstract class _CategoriesViewModelBase with Store, BaseViewModel {
  List<CategoriesModel> categories = [
    CategoriesModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Vegetables'),
    CategoriesModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Fruits'),
    CategoriesModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Snacks'),
    CategoriesModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Breakfast'),
    CategoriesModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Staple Food'),
    CategoriesModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
  ];

  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
