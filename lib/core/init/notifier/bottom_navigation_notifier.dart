import 'dart:async';

import 'package:flutter/material.dart';

// import '../../../view/login/model/init_model.dart';

// class BottomNavigationNotifier extends ChangeNotifier {
//   final StreamController<BottomNavigationNotifierModel> _isBarStream =
//       StreamController<BottomNavigationNotifierModel>.broadcast();

//   final BottomNavigationNotifierModel _data =
//       BottomNavigationNotifierModel(data: {}, index: 0);

//   void setTabIndex({required int index}) {
//     _data.index = index;
//     _data.data = {};
//     _isBarStream.add(_data);
//   }

//   void setTabIndexAndData({required index, required data}) {
//     _data.index = index;
//     _data.data = data;
//     _isBarStream.add(_data);
//   }

//   Stream<BottomNavigationNotifierModel> get barStream => _isBarStream.stream;
// }

// class BottomNavigationNotifierModel {
//   int index;
//   dynamic data;
//   BottomNavigationNotifierModel({required this.index, this.data});
// }
