import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodul/core/base/viewmodel/base_view_model.dart';
import 'package:foodul/core/init/lang/locale_keys.g.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;

  TextEditingController? searchController;
  TabController? tabController;

  @observable
  int selectedIndex = 0;

  @observable
  bool data = true;

  @action
  bool getSelected(int value) {
    return selectedIndex == value;
  }

  final feedData = [
    {
      'photo':
          'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
      'name': 'Elma',
      'kcal': '200',
      'quantity ': '2',
      'co2': '-100 CO2',
      'time': '2021-05-06T10:37:30.250Z',
      'text': 'Bugün NSIstanbul etkinliğine gelen var mı ?'
    },
    {
      'photo':
          'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2439&q=80',
      'name': 'Muz',
      'kcal': '200',
      'quantity ': '4',
      'co2': '-100 CO2',
      'time': '2021-05-06T10:37:30.250Z',
      'text': 'Bugün NSIstanbul etkinliğine gelen var mı ?'
    },
    {
      'photo':
          'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2439&q=80',
      'name': 'Muz',
      'quantity ': '4',
      'kcal': '200',
      'co2': '-100 CO2',
      'time': '2021-05-06T10:37:30.250Z',
      'text': 'Bugün NSIstanbul etkinliğine gelen var mı ?'
    },
    {
      'photo':
          'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
      'name': 'Elma',
      'quantity ': '2',
      'kcal': '200',
      'co2': '-100 CO2',
      'time': '2021-05-06T10:37:30.250Z',
      'text': 'Bugün NSIstanbul etkinliğine gelen var mı ?'
    },
  ];

  List<String> tabs = [
    LocaleKeys.homeView_today.tr(),
    LocaleKeys.homeView_thisWeek.tr(),
    LocaleKeys.seeAll.tr(),
  ];

  void init() {}
}
