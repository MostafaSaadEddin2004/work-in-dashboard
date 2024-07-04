import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:work_in_dashboard/controller/api/services/training_services.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/model/training_data_table.dart';
import 'package:work_in_dashboard/model/training_model.dart';
import 'package:work_in_dashboard/view/components/add_card.dart';
import 'package:work_in_dashboard/view/components/info_text_field.dart';
import 'package:work_in_dashboard/view/components/search_text_field.dart';

class TrainingOpportunities extends StatefulWidget {
  const TrainingOpportunities({super.key});

  @override
  State<TrainingOpportunities> createState() => _TrainingOpportunitiesState();
}

class _TrainingOpportunitiesState extends State<TrainingOpportunities> {
  bool isAddMode = false;
  bool ascending = false;
  double opacity = 0.0;
  onSortColumn(columnIndex, ascending, List<TrainingModel> data) {
    if (columnIndex == 0) {
      if (ascending) {
        data.sort((a, b) => a.trainingCompany.compareTo(b.trainingCompany),);
      } else {
        data.sort((a, b) => b.trainingCompany.compareTo(a.trainingCompany),);
      }
    }
  }

  final _trainingCompany = TextEditingController();
  final _kindOfTrain = TextEditingController();
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
              future: TrainingServices.getAllTraining(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
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
                              'Training',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            SearchTextField(
                              hintText: 'Search a training',
                              onChanged: (value) {},
                              wantAdd: false,
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
                                'Kind of Training',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
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
                            label: Text(
                              'Actions',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                        source: NullTrainingDataTable(),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: opacity,
                        curve: Curves.easeInOut,
                        child: AddCard(
                          isAddMode: isAddMode,
                          fieldList: [
                            InfoTextField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Company location field is required';
                                }
                                return null;
                              },
                              controller: _trainingCompany,
                              hintText: 'Enter company name',
                              labelText: 'Company name',
                            ),
                            InfoTextField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Company location field is required';
                                }
                                return null;
                              },
                              controller: _kindOfTrain,
                              hintText: 'Enter job title',
                              labelText: 'Job title',
                            ),
                            InfoTextField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Company location field is required';
                                }
                                return null;
                              },
                              controller: _location,
                              hintText: 'Enter job title',
                              labelText: 'Job title',
                            ),
                          ],
                          onAddPressed: () {},
                          
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasData) {
                  var data = snapshot.data!;
                  return PaginatedDataTable(
                    rowsPerPage: 5,
                    columnSpacing: 28.w,
                    sortAscending: ascending,
                    sortColumnIndex: 0,
                    header: Row(
                      children: [
                        Text(
                          'Training',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        SearchTextField(
                          hintText: 'Search a training',
                          onChanged: (value) {
                            setState(() {
                              data = value == null
                                  ? data
                                  : data
                                      .where((element) =>
                                          element.kindOfTrain.contains(value))
                                      .toList();
                            });
                          },
                          wantAdd: true,
                        ),
                      ],
                    ),
                    columns: [
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Company',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
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
                          'Kind Of Training',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Location',
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
                    source: TrainingDataTable(trainingData: data),
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
