import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:work_in_dashboard/controller/bloc/job_services/job_services_cubit.dart';
import 'package:work_in_dashboard/controller/constants/nav_items.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/model/job_data_table.dart';
import 'package:work_in_dashboard/model/job_model.dart';
import 'package:work_in_dashboard/view/components/add_button.dart';
import 'package:work_in_dashboard/view/components/search_text_field.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  bool ascending = false;
  onSortColumn(int columnIndex, bool ascendingF, List<JobModel> data) {
    if (columnIndex == 0) {
      if (ascendingF) {
        data.sort(
          (a, b) => a.companyName.compareTo(b.companyName),
        );
      } else {
        data.sort(
          (a, b) => b.companyName.compareTo(a.companyName),
        );
      }
    }
  }

  final GlobalKey<BeamerState> _beam = GlobalKey();

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
                    'Jobs',
                    style: Theme.of(context).textTheme.labelLarge,
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
                    sortAscending: ascending,
                    sortColumnIndex: 0,
                    header: Row(
                      children: [
                        AddButton(
                          text: 'Add new',
                          color: AppColor.blue,
                          onPressed: () {
                            setState(() {
                              _beam.currentState?.routerDelegate
                                  .beamToNamed(BeamerNavItem.addJob);
                            });
                          },
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        SearchTextField(
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
                      ],
                    ),
                    columns: [
                      DataColumn(
                        label: Text(
                          'Company',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        onSort: (columnIndex, ascendingF) {
                          setState(() {
                            ascending = ascendingF;
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
                      onEditPressed: () {
                        setState(() {
                          _beam.currentState?.routerDelegate
                              .beamToNamed(BeamerNavItem.updateJob);
                        });
                      },
                    ),
                  );
                }
                return PaginatedDataTable(
                  rowsPerPage: 5,
                  columnSpacing: Responsive.isDesktop(context) ? 100 : 20,
                  sortAscending: ascending,
                  sortColumnIndex: 0,
                  header: const Row(
                    children: [
                      AddButton(
                        text: 'Add new',
                        color: AppColor.blue,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      SearchTextField(
                        enabled: false,
                        hintText: 'Search a job',
                      ),
                    ],
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
