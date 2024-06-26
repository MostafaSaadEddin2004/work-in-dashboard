import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:work_in_dashboard/controller/api/services/training_services.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/model/training_data_table.dart';
import 'package:work_in_dashboard/view/components/add_job_card.dart';
import 'package:work_in_dashboard/view/components/info_text_field.dart';
import 'package:work_in_dashboard/view/components/search_text_field.dart';

class TrainingOpportunities extends StatefulWidget {
  const TrainingOpportunities({super.key});

  @override
  State<TrainingOpportunities> createState() => _TrainingOpportunitiesState();
}

class _TrainingOpportunitiesState extends State<TrainingOpportunities> {
  bool addMode = false;
  bool ascending = false;
  onSortColumn(columnIndex, ascending, List<dynamic> data) {
    if (columnIndex == 0) {
      if (ascending) {
        // data.sort((a, b) => a.name.compareTo(b.name),);
      } else {
        // data.sort((a, b) => b.name.compareTo(a.name),);
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
                        showFirstLastButtons: true,
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
                            label: Skeletonizer(
                              child: Text(
                                'Actions',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ],
                        source: NullTrainingDataTable(),
                      ),
                      AddCard(
                        addMode: addMode,
                        fieldList: [
                          InfoTextField(
                            controller: _trainingCompany,
                            enabled: true,
                            hintText: 'Enter company name',
                            labelText: 'Company name',
                          ),
                          InfoTextField(
                            controller: _kindOfTrain,
                            enabled: true,
                            hintText: 'Enter job title',
                            labelText: 'Job title',
                          ),
                          InfoTextField(
                            controller: _location,
                            enabled: true,
                            hintText: 'Enter job title',
                            labelText: 'Job title',
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
                  return PaginatedDataTable(
                    rowsPerPage: 5,
                    columnSpacing: 28.w,
                    showFirstLastButtons: true,
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
