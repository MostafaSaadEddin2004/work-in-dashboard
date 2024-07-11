import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_in_dashboard/controller/api/services/training_services.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/model/training_model.dart';
import 'package:work_in_dashboard/view/components/add_button.dart';
import 'package:work_in_dashboard/view/components/info_text_field.dart';
import 'package:work_in_dashboard/view/components/skeletonizer_text.dart';

class TrainingDataTable extends DataTableSource {
  final List<TrainingModel> trainingData;
  TrainingDataTable({required this.trainingData});
  final _trainingCompany = TextEditingController();
  final _kindOfTrain = TextEditingController();
  final _location = TextEditingController();
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(
          trainingData[index].trainingCompany,
          style: const TextStyle(fontSize: 14),
        ),
        showEditIcon: true,
        onTap: () {
          _trainingCompany.text = trainingData[index].trainingCompany;
          Get.defaultDialog(
            title: 'Edit company',
            content: InfoTextField(
              controller: _trainingCompany,
              labelText: 'Company',
              hintText: 'Enter Company',
            ),
            cancel: AddButton(
              text: 'Cancel',
              color: AppColor.red,
              onPressed: () {
                Get.back();
              },
            ),
            confirm: AddButton(
              text: 'Confirm',
              color: AppColor.blue,
              onPressed: () async {
                await TrainingServices.updateTraining(
                  id: trainingData[index].id,
                  trainingCompany: _trainingCompany.text,
                  kindOfTrain: trainingData[index].trainingCompany,
                  location: trainingData[index].location,
                );
                Get.back();
              },
            ),
          );
        },
      ),
      DataCell(
        Text(
          trainingData[index].kindOfTrain,
          style: const TextStyle(fontSize: 14),
        ),
        showEditIcon: true,
        onTap: () {
          _kindOfTrain.text = trainingData[index].kindOfTrain;
          Get.defaultDialog(
            title: 'Edit Training',
            content: InfoTextField(
              controller: _kindOfTrain,
              labelText: 'Kind of training',
              hintText: 'Enter kind of training',
            ),
            cancel: AddButton(
              text: 'Cancel',
              color: AppColor.red,
              onPressed: () {
                Get.back();
              },
            ),
            confirm: AddButton(
              text: 'Confirm',
              color: AppColor.blue,
              onPressed: () async {
                await TrainingServices.updateTraining(
                  id: trainingData[index].id,
                  trainingCompany: trainingData[index].trainingCompany,
                  kindOfTrain: _kindOfTrain.text,
                  location: trainingData[index].location,
                );
                Get.back();
              },
            ),
          );
        },
      ),
      DataCell(
        Text(
          trainingData[index].location,
          style: const TextStyle(fontSize: 14),
        ),
        showEditIcon: true,
        onTap: () {
          _location.text = trainingData[index].location;
          Get.defaultDialog(
            title: 'Edit location',
            content: InfoTextField(
              controller: _location,
              labelText: 'Location',
              hintText: 'Enter Location',
            ),
            cancel: AddButton(
              text: 'Cancel',
              color: AppColor.red,
              onPressed: () {
                Get.back();
              },
            ),
            confirm: AddButton(
              text: 'Confirm',
              color: AppColor.blue,
              onPressed: () async {
                await TrainingServices.updateTraining(
                    id: trainingData[index].id,
                    trainingCompany: trainingData[index].trainingCompany,
                    kindOfTrain: trainingData[index].kindOfTrain,
                    location: _location.text);
                Get.back();
              },
            ),
          );
        },
      ),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () async {
                await TrainingServices.deleteTraining(
                    id: trainingData[index].id);
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
          kindOfTrain: 'kindOfTrain',
          location: 'location',
          createdAt: DateTime(2024, 6, 25),
          updatedAt: DateTime(2024, 6, 25),
          version: 1));
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(SkeletonizerText(text: _data[index].trainingCompany)),
      DataCell(SkeletonizerText(text: _data[index].kindOfTrain)),
      DataCell(SkeletonizerText(text: _data[index].location)),
      DataCell(Row(
        children: [
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
