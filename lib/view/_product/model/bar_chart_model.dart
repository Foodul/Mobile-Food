import 'package:flutter/material.dart';

class BarChartModelData {
  double value;
  final int x;
  List<BarChartStackData> stackDataItem;
  BarChartModelData({
    required this.x,
    required this.value,
    required this.stackDataItem,
  });
}

class BarChartStackData {
  Color? color;
  final double fromY;
  final double toY;
  final String label;

  BarChartStackData({
    required this.fromY,
    required this.toY,
    required this.label,
    this.color,
  });
}

class LabelColorModel {
  final String label;
  final Color color;

  LabelColorModel(this.label, this.color);
}
