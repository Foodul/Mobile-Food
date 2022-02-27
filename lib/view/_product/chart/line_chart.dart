import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../model/indicator_model.dart';
import '../model/line_chart_model.dart';

class CustomLineChart extends StatefulWidget {
  final LineChartModel lineChart;
  final String Function(double)? bottomTitleList;

  const CustomLineChart({
    Key? key,
    required this.lineChart,
    required this.bottomTitleList,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => CustomLineChartState();
}

class CustomLineChartState extends State<CustomLineChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 2 / 1.5,
          child: LineChart(
            lineChartData(widget.lineChart),
            swapAnimationDuration: const Duration(milliseconds: 250),
          ),
        ),
        indicatorList(context)
      ],
    );
  }

  LineChartData lineChartData(LineChartModel lineData) => LineChartData(
        lineTouchData: LineTouchData(
            touchTooltipData:
                LineTouchTooltipData(tooltipBgColor: Colors.grey[300])),
        axisTitleData: FlAxisTitleData(
          leftTitle: AxisTitle(
            showTitle: lineData.leftAxisTitle != null,
            textStyle: const TextStyle(fontSize: 12),
            titleText: lineData.leftAxisTitle,
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
        ),
        titlesData: titlesData,
        borderData: FlBorderData(
            show: true,
            border: const Border.symmetric(
                horizontal: BorderSide(
              color: Colors.blueGrey,
              width: 0.4,
            ))),
        lineBarsData: List.generate(lineData.dataList.length, (i) {
          return lineChartBarData(lineData.dataList[i]);
        }),
        maxX: lineData.maxX,
        minX: lineData.minX,
        maxY: lineData.maxY,
        minY: lineData.minY,
      );

  //    color: Colors.blueGrey,
  // strokeWidth: 0.4,
  // dashArray: [8, 4],

  LineChartBarData lineChartBarData(LineBarDataModel data) => LineChartBarData(
        isCurved: true,
        barWidth: 6,
        isStrokeCapRound: true,
        colors: [data.lineColor ?? Colors.black],
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
            strokeColor: Colors.white,
            radius: 5,
            strokeWidth: 2,
            color: data.lineColor ?? Colors.black,
          ),
        ),
        belowBarData: BarAreaData(show: false),
        spots: List.generate(
          data.spots.length,
          (index) {
            var item = data.spots[index];
            return FlSpot(item.x ?? 0, item.y ?? 0);
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (context, i) => const TextStyle(
                fontWeight: FontWeight.normal, color: Colors.black54),
            getTitles: (value) => value.toInt().toString()),
      );

  SideTitles leftTitles({required GetTitleFunction getTitles}) => SideTitles(
        getTitles: getTitles,
        showTitles: true,
        // margin: 8,
        interval: 1,
        reservedSize: 40,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff75729e),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 10,
        margin: 10,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
          overflow: TextOverflow.ellipsis,
          color: Color(0xff72719b),
        ),
        textAlign: TextAlign.center,
        getTitles: widget.bottomTitleList,
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xff4e4965), width: 4),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  lineSpotTotal(value) => value
      .map((e) => e.y!.toInt())
      .toList()
      .reduce((value, element) => value + element);

  Widget indicatorList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, top: context.normalValue),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: List.generate(
            widget.lineChart.dataList.length,
            (index) => FractionallySizedBox(
                  widthFactor: 0.49,
                  child: IndicatorModel(
                    color: widget.lineChart.dataList[index].lineColor ??
                        Colors.black,
                    text:
                        '${widget.lineChart.dataList[index].label} ${lineSpotTotal(widget.lineChart.dataList[index].spots)}',
                    textStyle: context.textTheme.bodyText2!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                )),
      ),
    );
  }
}
