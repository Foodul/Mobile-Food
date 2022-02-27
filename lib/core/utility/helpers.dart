import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

String parseDateFormat(String date) {
  return DateFormat('dd-MM-yyyy').format(DateTime.parse(date));
}

Color setColorFormat(int index) {
  final List<Color> appColors = [
    const Color(0xFF0D1C2E),
    const Color(0xFF425466),
    const Color(0xFF3E66FB),
    const Color(0xFF03249D),
    const Color(0xFFEC002D),
    const Color(0xFF838F9C),
    const Color(0xFFEC7F00),
    const Color(0xFF469E7B),
    const Color(0xFF00C382),
  ];

  return appColors.length > index
      ? appColors[index]
      : Colors.primaries[Random().nextInt(17)];
}
