import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:work_in_dashboard/controller/api/services/job_services.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/model/job_data_table.dart';
import 'package:work_in_dashboard/model/job_model.dart';
import 'package:work_in_dashboard/view/components/add_card.dart';
import 'package:work_in_dashboard/view/components/gender_radio_buttons.dart';
import 'package:work_in_dashboard/view/components/info_text_field.dart';
import 'package:work_in_dashboard/view/components/search_text_field.dart';

class JobOpportunitiesScreen extends StatefulWidget {
  const JobOpportunitiesScreen({super.key});

  @override
  State<JobOpportunitiesScreen> createState() => _JobOpportunitiesScreenState();
}

class _JobOpportunitiesScreenState extends State<JobOpportunitiesScreen> {
  bool isAddMode = false;
  double opacity = 0.0;
  bool isAddLoading = false;
  bool ascending = false;
  onSortColumn(int columnIndex, bool ascendingF, List<JobModel> data) {
    if (columnIndex == 0) {
      if (ascendingF) {
        filterData!.sort(
          (a, b) => a.companyName.compareTo(b.companyName),
        );
      } else {
        filterData!.sort(
          (a, b) => b.companyName.compareTo(a.companyName),
        );
      }
    }
  }

  List<JobModel>? filterData;
  final _companyName = TextEditingController();
  final _jobTitle = TextEditingController();
  final _experiencesForJob = TextEditingController();
  final _workTime = TextEditingController();
  final _location = TextEditingController();
  int selectedGender = 1;
  GlobalKey<FormState> formKey = GlobalKey();
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
                  return PaginatedDataTable(
                    rowsPerPage: 5,
                    columnSpacing: 28.w,
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
                          wantAdd: false,
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
                  );
                } else if (snapshot.hasData) {
                  var data = snapshot.data!;
                  return Column(
                    children: [
                      PaginatedDataTable(
                        rowsPerPage: 5,
                        columnSpacing: 28.w,
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
                                  filterData = data
                                      .where((element) =>
                                          element.companyName.contains(value!))
                                      .toList();
                                });
                              },
                              wantAdd: false,
                              
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
                              onSortColumn(columnIndex, ascendingF,
                                  filterData == null ? data : filterData!);
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
                            jobData: filterData == null ? data : filterData!),
                      ),
                      Form(
                        key: formKey,
                        child: AnimatedOpacity(
                          duration: const Duration(seconds: 1),
                          opacity: opacity,
                          curve: Curves.easeInOut,
                          child: AddCard(
                            isAddMode: isAddMode,
                            isAddLoading: isAddLoading,
                            fieldList: [
                              InfoTextField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Company name field is required';
                                  }
                                  return null;
                                },
                                controller: _companyName,
                                hintText: 'Enter company name',
                                labelText: 'Company name',
                              ),
                              InfoTextField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Job title field is required';
                                  }
                                  return null;
                                },
                                controller: _jobTitle,
                                hintText: 'Enter job title',
                                labelText: 'Job title',
                              ),
                              InfoTextField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Required experiences field is required';
                                  }
                                  return null;
                                },
                                controller: _experiencesForJob,
                                hintText: 'Enter required experiences',
                                labelText: 'Required experiences',
                              ),
                              InfoTextField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Work time field is required';
                                  }
                                  return null;
                                },
                                controller: _workTime,
                                hintText: 'Enter work time',
                                labelText: 'WorkTime',
                              ),
                              InfoTextField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Company location field is required';
                                  }
                                  return null;
                                },
                                controller: _location,
                                hintText: 'Enter company location',
                                labelText: 'Company location',
                              ),
                              GenderRadioButton(
                                selectedRadio: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value!;
                                  });
                                },
                              )
                            ],
                            onAddPressed: () async {
                              if (formKey.currentState!.validate()) {
                                try {
                                  setState(() {
                                    isAddLoading = true;
                                  });
                                  await JobServices.addJob(
                                      companyName: _companyName.text,
                                      jobTitle: _jobTitle.text,
                                      experiencesForJob:
                                          _experiencesForJob.text,
                                      workTime: _workTime.text,
                                      companyNav: _location.text,
                                      gender: selectedGender == 1
                                          ? 'Male'
                                          : 'Female');
                                  setState(() {
                                    isAddLoading = false;
                                  });
                                  Get.defaultDialog(
                                      title: 'Congrats!',
                                      content: const Text(
                                        'Job has been added successfully',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.white,
                                        ),
                                      ));
                                } on HttpException catch (e) {
                                  Get.defaultDialog(
                                      title: 'Warning',
                                      content: Text(
                                        e.message,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColor.white,
                                        ),
                                      ));
                                  setState(() {
                                    isAddLoading = false;
                                  });
                                }
                              }
                            },
                            onCancelPressed: () {
                              setState(() {
                                isAddMode = false;
                                opacity = 0.0;
                              });
                            },
                          ),
                        ),
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
