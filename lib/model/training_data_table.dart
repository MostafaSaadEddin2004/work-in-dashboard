import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/model/training_model.dart';
import 'package:work_in_dashboard/view/components/skeletonizer_text.dart';

class TrainingDataTable extends DataTableSource {
  final List<TrainingModel> trainingData;
  TrainingDataTable({required this.trainingData});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(
          trainingData[index].id,
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
      DataCell(
        Text(
          trainingData[index].trainingCompany,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mode_edit_rounded,
                size: 25,
              )),
          IconButton(
              onPressed: () {
                Get.defaultDialog(title: 'Edit a job',content: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 240, vertical: 120),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColor.primary),
                      child: Column(children: [
                        TextFormField()
                      ],),
                ));
              },
              icon: const Icon(
                Icons.delete_rounded,
                size: 25,
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
          kindOfTrain: 'kindOfTrain',
          location: 'location'));
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(SkeletonizerText(text: _data[index].id)),
      DataCell(SkeletonizerText(text: _data[index].trainingCompany)),
      DataCell(SkeletonizerText(text: _data[index].kindOfTrain)),
      DataCell(SkeletonizerText(text: _data[index].location)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mode_edit_rounded,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_rounded,
                size: 25,
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
