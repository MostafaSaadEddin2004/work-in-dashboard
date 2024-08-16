import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:work_in_dashboard/controller/bloc/training_services/training_services_cubit.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/model/training_data_table.dart';
import 'package:work_in_dashboard/model/training_model.dart';
import 'package:work_in_dashboard/view/components/search_text_field.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  bool ascending = false;
  onSortColumn(columnIndex, ascending, List<TrainingModel> data) {
    if (columnIndex == 0) {
      if (ascending) {
        data.sort(
          (a, b) => a.trainingCompany.compareTo(b.trainingCompany),
        );
      } else {
        data.sort(
          (a, b) => b.trainingCompany.compareTo(a.trainingCompany),
        );
      }
    }
  }

  // final GlobalKey<BeamerState> _beam = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: BlocBuilder<TrainingServicesCubit, TrainingServicesState>(
          bloc: TrainingServicesCubit()..getAllTraining(),
          builder: (context, state) {
            if (state is TrainingServicesFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state is TrainingServicesFetched) {
              var data = state.trainingData;
              return PaginatedDataTable(
                rowsPerPage: data.length < 5 ? data.length : 8,
                columnSpacing: Responsive.isDesktop(context) ? 208 : 20,
                horizontalMargin: 16,
                sortAscending: ascending,
                sortColumnIndex: 0,
                header: Row(
                  children: [
                    Text(
                      'Training',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  
                    SearchTextField(
                      enabled: true,
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
                        onSortColumn(columnIndex, ascending, data);
                      });
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
                source: TrainingDataTable(
                  trainingData: data,
                  context: context,
                  onEditPressed: () {},
                ),
              );
            }
            return PaginatedDataTable(
              rowsPerPage: 5,
              columnSpacing: Responsive.isDesktop(context) ? 208 : 20,
              horizontalMargin: 16,
              sortAscending: ascending,
              sortColumnIndex: 0,
              header: Row(
                children: [
                  Text(
                    'Training',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const SearchTextField(
                    enabled: false,
                    hintText: 'Search a training',
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
                      'Kind of training',
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
            );
          },
        ),
      ),
    );
  }
}
