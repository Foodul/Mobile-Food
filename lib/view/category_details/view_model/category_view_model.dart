import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodul/core/base/viewmodel/base_view_model.dart';
import 'package:foodul/view/categories/model/categories_model.dart';
import 'package:foodul/view/category_details/model/category_detail_model.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';
part 'category_view_model.g.dart';

class CategoryDetailViewModel = _CategoryDetailViewModelBase
    with _$CategoryDetailViewModel;

abstract class _CategoryDetailViewModelBase with Store, BaseViewModel {
  CategoriesModel? categoryDetail;
  List tabs = [
    {
      'title': 'All',
    },
    {
      'title': 'Some',
    },
    {
      'title': 'Default',
    },
  ];

  List<CategoriesModel> categories = [
    CategoriesModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        details: [
          CategoryDetails(
            image:
                'https://www.nutraingredients-usa.com/var/wrbm_gb_food_pharma/storage/images/_aliases/wrbm_large/publications/food-beverage-nutrition/nutraingredients-usa.com/news/research/tomato-powder-beats-isolated-lycopene-in-study-but-expert-questions-scope-of-conclusions/12238409-1-eng-GB/Tomato-powder-beats-isolated-lycopene-in-study-but-expert-questions-scope-of-conclusions.jpg',
            title: 'Tomato',
          ),
          CategoryDetails(
              image:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlh0LgYlZtVPPNHIeIn0GClJ90-uKR0vN9j9sjh0i1P5BqpRuDrkGSvEPvXy9wSchPSm0&usqp=CAU',
              title: 'Tomato'),
          CategoryDetails(
            image:
                'https://www.tohumsanati.com/yalcin-biber-tohumutatlitarla-carliston-biberler-yuksel-tohum-339-50-B.jpg',
            title: 'Peper',
          ),
        ],
        title: 'Vegetables'),
    CategoriesModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Fruits',
        details: [
          CategoryDetails(
            image: 'https://www.seraf.com.tr/kivi-500-g-meyve-1094-35-B.jpg',
            title: 'Kiwi',
          ),
          CategoryDetails(
            image:
                'https://www.verita.com.tr/wp-content/uploads/2014/08/muz.jpg',
            title: 'Banana',
          ),
          CategoryDetails(
            image:
                'https://www.mda-agro.com/en/tekno_dosyalar/large/20_07_18_23640_837d356571561e3e1aaa8579374c6995.jpg',
            title: 'Mandarin',
          ),
          CategoryDetails(
            image:
                'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
            title: 'Apple',
          ),
          CategoryDetails(
            image:
                'https://m.media-amazon.com/images/I/61OHAsXEmgL._SS500_.jpg',
            title: 'Pear',
          ),
          CategoryDetails(
            image:
                'https://static.libertyprim.com/files/familles/peche-large.jpg?1574630286',
            title: 'Peach',
          ),
          CategoryDetails(
            image:
                'https://pbs.twimg.com/profile_images/459401470/strawberry_400x400.png',
            title: 'Strawberry',
          ),
        ]),
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

  List<CategoryDetailModel> items = [
    CategoryDetailModel(
        image: 'https://www.seraf.com.tr/kivi-500-g-meyve-1094-35-B.jpg',
        title: 'Vegetables'),
    CategoryDetailModel(
        image: 'https://www.seraf.com.tr/kivi-500-g-meyve-1094-35-B.jpg',
        title: 'Fruits'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Snacks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Breakfast'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Staple Food'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
    CategoryDetailModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Drinks'),
  ];

  void setConstructorData(data) {
    categoryDetail = data;
  }

  @observable
  List<double> tabWidths = [];

  @observable
  int selectedTab = 0;

  void setHeigth(double value) {
    inputHeight = value;
  }

  PageController pageController = PageController(
    initialPage: 0,
  );

  @observable
  double inputHeight = 0.0;

  final ScrollController controller = ScrollController();

  bool isOneTab = true;

  @action
  void changeSelectTab2(item) {
    selectedTab = item;
  }

  @action
  void changeSelectedTab(int index, bool isTab) {
    // Check if the selection difference is two
    if ((selectedTab - index).abs() == 2) {
      selectedTab = index;
      /** If it is then change isOneTab as false in order to prevent 
       * from the page change comes from the page view
       * */
      isOneTab = false;
    } else {
      if (isOneTab) {
        selectedTab = index;
      }
      isOneTab = true;
    }
    if (isTab) {
      // In order to slide the page when the tab pressed
      pageController.animateToPage(
        selectedTab,
        duration: context!.durationLow,
        curve: Curves.ease,
      );
    }
    // In order to prevent request missings when changing tabs
  }

  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
