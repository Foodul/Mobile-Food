import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodul/core/base/viewmodel/base_view_model.dart';
import 'package:foodul/view/_product/model/line_chart_model.dart';
import 'package:mobx/mobx.dart';
part 'profil_view_model.g.dart';

class ProfilViewModel = _ProfilViewModelBase with _$ProfilViewModel;

abstract class _ProfilViewModelBase with Store, BaseViewModel {
  late PageController pageviewController;
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  Future<void> init() async {
    pageviewController = PageController();
    Future.delayed(Duration.zero, () {
      changeTabSelect(2);
    });
  }

  List tabs = ['CO2 İstatistiğim', "Kalori Alımlarım", "Arkadaşlarım"];

  @observable
  int tabsSelectIndex = 0;

  @action
  changeTabSelect(value) {
    tabsSelectIndex = value;
    // pageviewController.jumpToPage(value);
    pageviewController.animateToPage(value,
        duration: const Duration(milliseconds: 400), curve: Curves.bounceInOut);
  }

  get corbonReportsData => LineChartModel(
        maxY: 15,
        maxX: 6,
        minX: 0,
        minY: 0,
        // leftAxisTitle: LocaleKeys.ReportView_suggestionsCount.locale,
        leftAxisTitle: 'CO2 Sayısı',
        dataList: [
          LineBarDataModel(
            spots: [
              SpotDataModel(x: 1, y: 1),
              SpotDataModel(x: 3, y: 3),
              SpotDataModel(x: 5, y: 5),
            ],
            lineColor: setColorFormat(6),
            label: 'Önerilen',
          ),
          LineBarDataModel(
            spots: [
              SpotDataModel(x: 1, y: 2),
              SpotDataModel(x: 3, y: 5),
              SpotDataModel(x: 5, y: 6),
            ],
            lineColor: setColorFormat(9),
            label: 'Karbon Ayak İzim',
          ),
        ].toList(),
      );

  get caloriReport => LineChartModel(
        maxY: 15,
        maxX: 6,
        minX: 0,
        minY: 0,
        // leftAxisTitle: LocaleKeys.ReportView_suggestionsCount.locale,
        leftAxisTitle: 'Kalori Alımı',
        dataList: [
          LineBarDataModel(
            spots: [
              SpotDataModel(x: 1, y: 1),
              SpotDataModel(x: 3, y: 3),
              SpotDataModel(x: 5, y: 5),
            ],
            lineColor: setColorFormat(9),
            label: 'Alınan Kalori',
          ),
          // LineBarDataModel(
          //   spots: [
          //     SpotDataModel(x: 1, y: 2),
          //     SpotDataModel(x: 3, y: 5),
          //     SpotDataModel(x: 5, y: 6),
          //   ],
          //   lineColor: setColorFormat(9),
          //   label: 'Karbon Ayak İzim',
          // ),
        ].toList(),
      );

  List<String> friendList = [
    'Yolanda',
    'Lynnelle',
    'Leann',
    'Levey',
    'Miof mela',
    'Joe',
    'Lani',
    'Perl',
    'Jenn',
    'Ebony',
    'Etienne',
    'Kakalina',
    'Claiborn',
    'Stu',
    'Hattie',
    'Gwyn',
    'Sarina',
    'Leo',
    'Tybi',
    'Arlena'
  ];

  Color setColorFormat(int index) {
    final List<Color> appColors = [
      const Color(0xFF0D1C2E),
      const Color(0xFF425466),
      const Color(0xFF3E66FB),
      const Color(0xFF03249D),
      const Color(0xFFF0F3F5),
      const Color(0xFFE2E6EC),
      const Color(0xFF838F9C),
      const Color(0xFFEC7F00),
      const Color(0xFF00C382),
      const Color(0xFF483FF7), //pripurble
      const Color(0xFF51DC8E), //green
    ];

    return appColors.length > index
        ? appColors[index]
        : Colors.primaries[Random().nextInt(17)];
  }

  bottomTitleQuarterMonths(value, q1, q2, q3) {
    switch (value.toInt()) {
      case 1:
        return q1;
      case 3:
        return q2;
      case 5:
        return q3;
      default:
        return "";
    }
  }
}
