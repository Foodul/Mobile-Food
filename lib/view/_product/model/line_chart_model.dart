import 'package:flutter/material.dart';

class LineChartModel {
  final List<LineBarDataModel> dataList;
  final String? leftAxisTitle;

  final double maxX;
  final double minX;
  final double maxY;
  final double minY;

  LineChartModel({
    required this.dataList,
    this.leftAxisTitle,
    required this.maxX,
    required this.minX,
    required this.maxY,
    required this.minY,
  });
}

// ****
class LineBarDataModel {
  final List<SpotDataModel> spots;
  Color? lineColor;
  final String label;
  LineBarDataModel({
    this.lineColor,
    required this.spots,
    required this.label,
  });
}

class SpotDataModel {
  double? x;
  double? y;
  SpotDataModel({required this.x, required this.y});

  SpotDataModel.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['value'];
  }
}
// ****
