import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:work_in_dashboard/controller/api/services/job_services.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/model/job_data_table.dart';
import 'package:work_in_dashboard/view/components/add_job_card.dart';
import 'package:work_in_dashboard/view/components/info_text_field.dart';
import 'package:work_in_dashboard/view/components/search_text_field.dart';

class JobOpportunitiesScreen extends StatefulWidget {
  const JobOpportunitiesScreen({super.key});

  @override
  State<JobOpportunitiesScreen> createState() => _JobOpportunitiesScreenState();
}

class _JobOpportunitiesScreenState extends State<JobOpportunitiesScreen> {
  bool addMode = false;
  String? gender;
  bool ascending = false;
  onSortColumn(int columnIndex, bool ascending, List<dynamic> data) {
    if (columnIndex == 0) {
      if (ascending) {
        data.sort(
          (a, b) => a.name.compareTo(b.name),
        );
      } else {
        data.sort(
          (a, b) => b.name.compareTo(a.name),
        );
      }
    }
  }

  final _companyName = TextEditingController();
  final _jobTitle = TextEditingController();
  final _experiencesForJob = TextEditingController();
  final _workTime = TextEditingController();
  final _location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            FutureBuilder(
              future: JobServices.getAllJobs(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Column(
                    children: [
                      PaginatedDataTable(
                        rowsPerPage: 5,
                        columnSpacing: 28.w,
                        showFirstLastButtons: true,
                        sortAscending: ascending,
                        sortColumnIndex: 0,
                        header: Row(
                          children: [
                            Text(
                              'jobs',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            SearchTextField(
                              hintText: 'Search a job',
                              onChanged: (value) {},
                              wantAdd: true,
                              onAddPressed: () {
                                setState(() {
                                  addMode = true;
                                });
                              },
                            ),
                          ],
                        ),
                        columns: [
                          DataColumn(
                            label: Skeletonizer(
                              child: Text(
                                'Id',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            onSort: (columnIndex, ascending) {},
                          ),
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
                            label: Skeletonizer(
                              child: Text(
                                'Actions',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ],
                        source: NullJobdataTable(),
                      ),
                      AddCard(
                        addMode: addMode,
                        fieldList: [
                          InfoTextField(
                            controller: _companyName,
                            enabled: true,
                            hintText: 'Enter company name',
                            labelText: 'Company name',
                          ),
                          InfoTextField(
                            controller: _jobTitle,
                            enabled: true,
                            hintText: 'Enter job title',
                            labelText: 'Job title',
                          ),
                          InfoTextField(
                            controller: _experiencesForJob,
                            enabled: true,
                            hintText: 'Enter required experiences',
                            labelText: 'Required experiences',
                          ),
                          InfoTextField(
                            controller: _workTime,
                            enabled: true,
                            hintText: 'Enter work time',
                            labelText: 'WorkTime',
                          ),
                          InfoTextField(
                            controller: _location,
                            enabled: true,
                            hintText: 'Enter company location',
                            labelText: 'Company location',
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gender',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: const Text('Choose gender'),
                                  items: [
                                    DropdownMenuItem(
                                      child: Text('Male',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                      value: 'Male',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Female',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                      value: 'Female',
                                    ),
                                  ],
                                  value: gender,
                                  style: Theme.of(context).textTheme.bodySmall,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value!;
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 46,
                                    width: 240.w,
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: AppColor.primary,
                                    ),
                                    elevation: 1,
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                    ),
                                    iconSize: 24,
                                    iconEnabledColor: AppColor.white,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 100,
                                    width: 240.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: AppColor.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                        onAddAnotherPressed: () {},
                        onAddPressed: () {},
                        onCancelPressed: () {
                          setState(() {
                            addMode = false;
                          });
                        },
                      ),
                    ],
                  );
                } else if (snapshot.hasData) {
                  var data = snapshot.data!;
                  return Column(
                    children: [
                      PaginatedDataTable(
                        rowsPerPage: 5,
                        columnSpacing: 28.w,
                        showFirstLastButtons: true,
                        sortAscending: ascending,
                        sortColumnIndex: 0,
                        header: Row(
                          children: [
                            Text(
                              'jobs',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            SearchTextField(
                              hintText: 'Search a job',
                              onChanged: (value) {
                                setState(() {
                                  data = value == null
                                      ? data
                                      : data
                                          .where((element) =>
                                              element.jobTitle.contains(value))
                                          .toList();
                                });
                              },
                              wantAdd: true,
                              onAddPressed: () {
                                setState(() {
                                  addMode = true;
                                });
                              },
                            ),
                          ],
                        ),
                        columns: [
                          DataColumn(
                            label: Text(
                              'Id',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                ascending = !ascending;
                              });
                              onSortColumn(columnIndex, ascending, data);
                            },
                          ),
                          DataColumn(
                            label: Text(
                              'Company',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                ascending = !ascending;
                              });
                              onSortColumn(columnIndex, ascending, data);
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
                        source: JobdataTable(jobData: data),
                      ),
                      AddCard(
                        addMode: addMode,
                        fieldList: [
                          InfoTextField(
                            controller: _companyName,
                            enabled: true,
                            hintText: 'Enter company name',
                            labelText: 'Company name',
                          ),
                          InfoTextField(
                            controller: _jobTitle,
                            enabled: true,
                            hintText: 'Enter job title',
                            labelText: 'Job title',
                          ),
                          InfoTextField(
                            controller: _experiencesForJob,
                            enabled: true,
                            hintText: 'Enter required experiences',
                            labelText: 'Required experiences',
                          ),
                          InfoTextField(
                            controller: _workTime,
                            enabled: true,
                            hintText: 'Enter work time',
                            labelText: 'WorkTime',
                          ),
                          InfoTextField(
                            controller: _location,
                            enabled: true,
                            hintText: 'Enter company location',
                            labelText: 'Company location',
                          ),
                        ],
                        onAddAnotherPressed: () {},
                        onAddPressed: () {},
                        onCancelPressed: () {
                          setState(() {
                            addMode = false;
                          });
                        },
                      ),
                    ],
                  );
                }
                return const Center(
                  child: Text('There is no data'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
