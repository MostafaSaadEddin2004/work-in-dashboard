import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_in_dashboard/controller/bloc/company_service/company_services_cubit.dart';
import 'package:work_in_dashboard/controller/bloc/job_services/job_services_cubit.dart';
import 'package:work_in_dashboard/controller/bloc/training_services/training_services_cubit.dart';
import 'package:work_in_dashboard/controller/bloc/user_service/user_service_cubit.dart';
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
            Builder(builder: (context) {
              final usersState = context.read<UserServiceCubit>().state;
              final companiesState = context.read<CompanyServicesCubit>().state;
              final jobsState = context.read<JobServicesCubit>().state;
              final trainingState = context.read<TrainingServicesCubit>().state;
              if (usersState is UserServiceFetched &&
                  companiesState is CompanyServicesFetched &&
                  jobsState is JobServicesFetched &&
                  trainingState is TrainingServicesFetched) {
                final usersData = usersState.userData;
                final companiesData = companiesState.companyData;
                final jobsData = jobsState.jobData;
                final trainingData = trainingState.trainingData;
                return AspectRatio(
                  aspectRatio: 2.0,
                  child: BarChart(
                      swapAnimationCurve: Curves.linear,
                      swapAnimationDuration: const Duration(milliseconds: 200),
                      BarChartData(
                          barGroups: ChartData.monthlySummary(usersData,
                                  companiesData, jobsData, trainingData)
                              .map((e) => BarChartGroupData(
                                      x: e.companyX,
                                      barsSpace: 4,
                                      barRods: [
                                        BarChartRodData(
                                          toY: e.userY.toDouble(),
                                          color: AppColor.white,
                                          width: Responsive.isDesktop(context)
                                              ? 12
                                              : 2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        BarChartRodData(
                                          toY: e.companyY.toDouble(),
                                          color: AppColor.blue,
                                          width: Responsive.isDesktop(context)
                                              ? 12
                                              : 2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        BarChartRodData(
                                          toY: e.jobY.toDouble(),
                                          color: AppColor.red,
                                          width: Responsive.isDesktop(context)
                                              ? 12
                                              : 2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        BarChartRodData(
                                          toY: e.trainingY.toDouble(),
                                          color: AppColor.green,
                                          width: Responsive.isDesktop(context)
                                              ? 12
                                              : 2,
                                          borderRadius:
                                              BorderRadius.circular(4),
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
                              interval: 10,
                              reservedSize: 40,
                            )),
                            bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 48,
                                    getTitlesWidget:
                                        CharBarTitels.getBottomTitels)),
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
                );
              }
              return Center(
                  child: Text(
                'Something went wrong',
                style: Theme.of(context).textTheme.bodyMedium,
              ));
            }),
          ],
        ),
      ),
    );
  }
}
