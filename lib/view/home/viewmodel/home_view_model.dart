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
          'https://st2.depositphotos.com/7036298/10694/i/950/depositphotos_106948346-stock-photo-ripe-red-apple-with-green.jpg',
      'name': 'Elma',
      'kcal': '200',
      'quantity ': '2',
      'co2': '-100 CO2',
      'time': '2021-05-06T10:37:30.250Z',
      'text': 'Bugün NSIstanbul etkinliğine gelen var mı ?'
    },
    {
      'photo':
          'https://media.istockphoto.com/photos/banana-picture-id1184345169?k=20&m=1184345169&s=612x612&w=0&h=EKwCw7Zx20N3l8G_rQI6KcitWTQ5ahkgmEBr2QA1FMk=',
      'name': 'Muz',
      'kcal': '200',
      'quantity ': '4',
      'co2': '-100 CO2',
      'time': '2021-05-06T10:37:30.250Z',
      'text': 'Bugün NSIstanbul etkinliğine gelen var mı ?'
    },
    {
      'photo':
          'https://media.istockphoto.com/photos/banana-picture-id1184345169?k=20&m=1184345169&s=612x612&w=0&h=EKwCw7Zx20N3l8G_rQI6KcitWTQ5ahkgmEBr2QA1FMk=',
      'name': 'Muz',
      'quantity ': '4',
      'kcal': '200',
      'co2': '-100 CO2',
      'time': '2021-05-06T10:37:30.250Z',
      'text': 'Bugün NSIstanbul etkinliğine gelen var mı ?'
    },
    {
      'photo':
          'https://st2.depositphotos.com/7036298/10694/i/950/depositphotos_106948346-stock-photo-ripe-red-apple-with-green.jpg',
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
