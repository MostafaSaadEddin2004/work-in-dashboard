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
import 'package:work_in_dashboard/model/job_model.dart';
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
        child: BlocBuilder<JobServicesCubit, JobServicesState>(
          bloc: JobServicesCubit()..getAllJobs(),
          builder: (context, state) {
            if (state is JobServicesFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state is JobServicesFetched) {
              var data = state.jobData;
              return PaginatedDataTable(
                rowsPerPage: data.length < 5 ? data.length : 8,
                columnSpacing: 28.w,
                sortAscending: isAscending,
                sortColumnIndex: 0,
                header: Row(
                  children: [
                    Text(
                      'Jobs',
                      style: Theme.of(context).textTheme.labelLarge,
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
              header: Row(
                children: [
                  Text(
                    'Jobs',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const SearchTextField(
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
        ),
      ),
    );
  }
}

class JobdataTable extends DataTableSource {
  final List<JobModel> jobData;
  final BuildContext context;
  JobdataTable({
    required this.jobData,
    required this.context,
  });
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(
          jobData[index].companyName,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          jobData[index].companyNav,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          jobData[index].experiencesForJob,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          jobData[index].gender,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          jobData[index].jobTitle,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          jobData[index].workTime,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                context.goNamed(NavItemsName.updateJobName, queryParameters: {
                  'jobId': jobData[index].id,
                  'companyName': jobData[index].companyName,
                  'Email': jobData[index].email,
                  'Phone': jobData[index].phone,
                  'jobTitle': jobData[index].jobTitle,
                  'experiencesForJob': jobData[index].experiencesForJob,
                  'workTime': jobData[index].workTime,
                  'location': jobData[index].companyNav,
                  'gender': jobData[index].gender,
                });
              },
              icon: const Icon(
                Icons.edit_rounded,
                size: 25,
              )),
          IconButton(
              onPressed: () {
                context
                    .read<JobServicesCubit>()
                    .deleteJob(context, jobData[index].id);
              },
              icon: const Icon(
                Icons.delete_rounded,
                size: 25,
                color: AppColor.red,
              )),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => jobData.length;

  @override
  int get selectedRowCount => 0;
}
