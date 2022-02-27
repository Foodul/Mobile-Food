import 'package:flutter/material.dart';

class PieChartModel {
  Color? color;
  double? value;
  String? label;

  PieChartModel({this.color, this.value, this.label});

  PieChartModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }
}
