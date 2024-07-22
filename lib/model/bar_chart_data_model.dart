import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:work_in_dashboard/model/individual_bar_model.dart';

class ChartData {
  final IndividualBar jan;
  final IndividualBar feb;
  final IndividualBar mars;
  final IndividualBar apr;
  final IndividualBar may;
  final IndividualBar jun;
  final IndividualBar jul;
  final IndividualBar aug;
  final IndividualBar sep;
  final IndividualBar oct;
  final IndividualBar nov;
  final IndividualBar dec;

  ChartData(
      {required this.jan,
      required this.feb,
      required this.mars,
      required this.apr,
      required this.may,
      required this.jun,
      required this.jul,
      required this.aug,
      required this.sep,
      required this.oct,
      required this.nov,
      required this.dec});

  static List<IndividualBar> monthlySummary = [
    IndividualBar(ux: 0, uy: 10, cx: 0, cy: 5, jx: 0, jy: 19, tx: 0, ty: 5),
    IndividualBar(ux: 1, uy: 19, cx: 1, cy: 11, jx: 1, jy: 28, tx: 1, ty: 10),
    IndividualBar(ux: 2, uy: 27, cx: 2, cy: 13, jx: 2, jy: 33, tx: 2, ty: 7),
    IndividualBar(ux: 3, uy: 35, cx: 3, cy: 15, jx: 3, jy: 36, tx: 3, ty: 12),
    IndividualBar(ux: 4, uy: 42, cx: 4, cy: 16, jx: 4, jy: 40, tx: 4, ty: 10),
    IndividualBar(ux: 5, uy: 51, cx: 5, cy: 17, jx: 5, jy: 47, tx: 5, ty: 6),
    IndividualBar(ux: 6, uy: 61, cx: 6, cy: 19, jx: 6, jy: 55, tx: 6, ty: 16),
    IndividualBar(ux: 7, uy: 70, cx: 7, cy: 22, jx: 7, jy: 60, tx: 7, ty: 25),
    IndividualBar(ux: 8, uy: 75, cx: 8, cy: 22, jx: 8, jy: 68, tx: 8, ty: 16),
    IndividualBar(ux: 9, uy: 80, cx: 9, cy: 23, jx: 9, jy: 76, tx: 9, ty: 10),
    IndividualBar(
        ux: 10, uy: 83, cx: 10, cy: 26, jx: 10, jy: 80, tx: 10, ty: 16),
    IndividualBar(
        ux: 11, uy: 92, cx: 11, cy: 30, jx: 11, jy: 88, tx: 11, ty: 20),
  ];

  static ChartData barData = ChartData(
      jan: monthlySummary[0],
      feb: monthlySummary[1],
      mars: monthlySummary[2],
      apr: monthlySummary[3],
      may: monthlySummary[4],
      jun: monthlySummary[5],
      jul: monthlySummary[6],
      aug: monthlySummary[7],
      sep: monthlySummary[8],
      oct: monthlySummary[9],
      nov: monthlySummary[10],
      dec: monthlySummary[11]);

  static Widget getBottomTitels(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 14);
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Jan', style: style);
        break;
      case 1:
        text = const Text('Feb', style: style);
        break;
      case 2:
        text = const Text('Mar', style: style);
        break;
      case 3:
        text = const Text('Apr', style: style);
        break;
      case 4:
        text = const Text('May', style: style);
        break;
      case 5:
        text = const Text('Jun', style: style);
        break;
      case 6:
        text = const Text('Jul', style: style);
        break;
      case 7:
        text = const Text('Aug', style: style);
        break;
      case 8:
        text = const Text('Sep', style: style);
        break;
      case 9:
        text = const Text('Oct', style: style);
        break;
      case 10:
        text = const Text('Nov', style: style);
        break;
      case 11:
        text = const Text('Dec', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(child: text, axisSide: meta.axisSide);
  }
}
