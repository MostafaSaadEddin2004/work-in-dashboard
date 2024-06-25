import 'package:flutter/material.dart';
import 'package:work_in_dashboard/model/training_model.dart';

class TrainingDataTable extends DataTableSource {
  final List<TrainingModel> trainingData;
  TrainingDataTable({required this.trainingData});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(trainingData[index].id, style: const TextStyle(fontSize: 14),)),
      DataCell(Text(trainingData[index].kindOfTrain, style: const TextStyle(fontSize: 14),)),
      DataCell(Text(trainingData[index].location, style: const TextStyle(fontSize: 14),)),
      DataCell(Text(trainingData[index].trainingCompany, style: const TextStyle(fontSize: 14),)),
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
  int get rowCount => trainingData.length;

  @override
  int get selectedRowCount => 0;
}
