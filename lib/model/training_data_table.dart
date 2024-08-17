import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:work_in_dashboard/controller/bloc/training_services/training_services_cubit.dart';
import 'package:work_in_dashboard/controller/constants/nav_items.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/model/training_model.dart';
import 'package:work_in_dashboard/view/components/skeletonizer_text.dart';

class TrainingDataTable extends DataTableSource {
  final List<TrainingModel> trainingData;
  final BuildContext context;
  final void Function() onEditPressed;
  TrainingDataTable({
    required this.trainingData,
    required this.context,
    required this.onEditPressed,
  });
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(
          trainingData[index].trainingCompany,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          trainingData[index].kindOfTrain,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          trainingData[index].location,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                context.goNamed(
                  NavItemsName.updateTrainingName,
                  pathParameters: {
                    'trainingId': trainingData[index].id,
                    'trainingCompany': trainingData[index].trainingCompany,
                    'email': trainingData[index].email,
                    'phone': trainingData[index].phone,
                    'kindOfTrain': trainingData[index].kindOfTrain,
                    'location': trainingData[index].location,
                  }
                );
              },
              icon: const Icon(
                Icons.edit_rounded,
                size: 25,
              )),
          IconButton(
              onPressed: () {
                context
                    .read<TrainingServicesCubit>()
                    .deleteTraining(context, trainingData[index].id);
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
  int get rowCount => trainingData.length;

  @override
  int get selectedRowCount => 0;
}

class NullTrainingDataTable extends DataTableSource {
  final _data = List.generate(
      10,
      (index) => TrainingModel(
            id: 'dsfssfd60sdf4',
            trainingCompany: 'trainingCompany',
            email: 'asdadasd',
            phone: '09658465335',
            kindOfTrain: 'kindOfTrain',
            location: 'location',
            createdAt: DateTime(2024, 6, 25),
            updatedAt: DateTime(2024, 6, 25),
          ));
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(SkeletonizerText(text: _data[index].trainingCompany)),
      DataCell(SkeletonizerText(text: _data[index].kindOfTrain)),
      DataCell(SkeletonizerText(text: _data[index].location)),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_rounded,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
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
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
