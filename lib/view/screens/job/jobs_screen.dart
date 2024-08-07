import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:work_in_dashboard/controller/bloc/job_services/job_services_cubit.dart';
import 'package:work_in_dashboard/controller/constants/nav_items.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/model/job_data_table.dart';
import 'package:work_in_dashboard/view/components/add_button.dart';
import 'package:work_in_dashboard/view/components/search_text_field.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  bool isAscending = false;
  int sortColumnIndex = 0;

  int compareString(
    bool ascending,
    String value1,
    String value2,
  ) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

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
                  Row(
                    children: [
                      Text(
                        'Jobs',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      AddButton(
                        text: 'Create new',
                        color: AppColor.blue,
                        isAddLoading: false,
                        onPressed: () {
                          context.goNamed(NavItemsName.addJobName);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            BlocBuilder<JobServicesCubit, JobServicesState>(
              bloc: JobServicesCubit()..getAllJobs(),
              builder: (context, state) {
                if (state is JobServicesFailure) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                } else if (state is JobServicesFetched) {
                  var data = state.jobData;
                  return PaginatedDataTable(
                    rowsPerPage: data.length < 5 ? data.length : 5,
                    columnSpacing: 28.w,
                    sortAscending: isAscending,
                    sortColumnIndex: 0,
                    header: SearchTextField(
                      enabled: true,
                      hintText: 'Search a job',
                      onChanged: (value) {
                        setState(() {
                          data = value == null
                              ? data
                              : data
                                  .where((element) =>
                                      element.companyName.contains(value))
                                  .toList();
                        });
                      },
                    ),
                    columns: [
                      DataColumn(
                        label: Text(
                          'Company',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        onSort: (columnIndex, ascending) {
                          setState(() {
                            if (columnIndex == 0) {
                              data.sort((a, b) => compareString(
                                  ascending, a.companyName, b.companyName));
                            }
                            setState(() {
                              isAscending = ascending;
                              sortColumnIndex = columnIndex;
                            });
                          });
                        },
                      ),
                      DataColumn(
                        label: Text(
                          'Location',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Required Experiences',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Gender',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Job Title',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Work Time',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Actions',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                    source: JobdataTable(
                      jobData: data,
                      context: context,
                    ),
                  );
                }
                return PaginatedDataTable(
                  rowsPerPage: 5,
                  columnSpacing: Responsive.isDesktop(context) ? 100 : 20,
                  sortAscending: isAscending,
                  sortColumnIndex: 0,
                  header: const SearchTextField(
                    enabled: false,
                    hintText: 'Search a job',
                  ),
                  columns: [
                    DataColumn(
                      label: Skeletonizer(
                        child: Text(
                          'Company',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      onSort: (columnIndex, ascending) {},
                    ),
                    DataColumn(
                      label: Skeletonizer(
                        child: Text(
                          'Location',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Skeletonizer(
                        child: Text(
                          'Required Experiences',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Skeletonizer(
                        child: Text(
                          'Gender',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Skeletonizer(
                        child: Text(
                          'job Title',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Skeletonizer(
                        child: Text(
                          'Work Time',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Actions',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                  source: NullJobdataTable(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
