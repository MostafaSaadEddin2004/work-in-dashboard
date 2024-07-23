import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/char_bar_titels.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/model/bar_chart_data_model.dart';
import 'package:work_in_dashboard/view/components/item_card.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Column(
                children: [
                  Text(
                    'Dashboard',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            const Wrap(
              alignment: WrapAlignment.spaceEvenly,
              runAlignment: WrapAlignment.center,
              runSpacing: 8,
              spacing: 8,
              children: [
                ItemsCard(
                  circelColor: AppColor.white,
                  icon: Icons.person,
                  title: 'Users',
                  subtitbitle: 'User',
                ),
                ItemsCard(
                  circelColor: AppColor.blue,
                  icon: Icons.business_rounded,
                  title: 'Companies',
                  subtitbitle: 'Company',
                ),
                ItemsCard(
                  circelColor: AppColor.red,
                  icon: Icons.business_center_rounded,
                  title: 'Jobs',
                  subtitbitle: 'Job',
                ),
                ItemsCard(
                  circelColor: AppColor.green,
                  icon: Icons.accessibility_new_sharp,
                  title: 'Training',
                  subtitbitle: 'Training',
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            AspectRatio(
              aspectRatio: 2.0,
              child: BarChart(
                  swapAnimationCurve: Curves.linear,
                  swapAnimationDuration: const Duration(milliseconds: 200),
                  BarChartData(
                      barGroups: ChartData.monthlySummary
                          .map((e) => BarChartGroupData(
                                  x: e.cx,
                                  barsSpace: 4,
                                  barRods: [
                                    BarChartRodData(
                                      toY: e.uy,
                                      color: AppColor.white,
                                      width: 2.w,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    BarChartRodData(
                                      toY: e.cy,
                                      color: AppColor.blue,
                                      width: 2.w,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    BarChartRodData(
                                      toY: e.jy,
                                      color: AppColor.red,
                                      width: 2.w,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    BarChartRodData(
                                      toY: e.ty,
                                      color: AppColor.green,
                                      width: 2.w,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ]))
                          .toList(),
                      titlesData: const FlTitlesData(
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                          showTitles: false,
                        )),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(
                          showTitles: false,
                        )),
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                          showTitles: true,
                          interval: 20,
                          reservedSize: 40,
                        )),
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 48,
                                getTitlesWidget: CharBarTitels.getBottomTitels)),
                      ),
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(
                          border: const Border(
                        left: BorderSide(
                          color: AppColor.white,
                        ),
                        bottom: BorderSide(
                          color: AppColor.white,
                        ),
                      )),
                      minY: 0,
                      maxY: 100)),
            ),
          ],
        ),
      ),
    );
  }
}
