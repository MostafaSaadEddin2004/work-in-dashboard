import 'package:flutter/material.dart';
import 'package:work_in_dashboard/model/job_model.dart';
import 'package:work_in_dashboard/view/components/skeletonizer_text.dart';

class JobdataTable extends DataTableSource {
  final List<JobModel> jobData;
  JobdataTable({required this.jobData});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(
        jobData[index].id,
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        jobData[index].companyName,
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        jobData[index].companyNav,
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        jobData[index].experiencesForJob,
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        jobData[index].gender,
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        jobData[index].jobTitle,
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        jobData[index].workTime,
        style: const TextStyle(fontSize: 14),
      )),
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
  int get rowCount => jobData.length;

  @override
  int get selectedRowCount => 0;
}

class NullJobdataTable extends DataTableSource {
  final _data = List.generate(
      10,
      (index) => JobModel(
          id: 'sdfskf500',
          companyName: 'companyName',
          jobTitle: 'jobTitle',
          experiencesForJob: 'experiencesForJob',
          workTime: 'workTime',
          companyNav: 'companyNav',
          gender: 'gender',
          createdAt: DateTime(2024, 6, 25),
          updatedAt: DateTime(2024, 6, 25),
          version: 1));
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(SkeletonizerText(
        text: _data[index].id,
      )),
      DataCell(SkeletonizerText(
        text: _data[index].companyName,
      )),
      DataCell(SkeletonizerText(
        text: _data[index].companyNav,
      )),
      DataCell(SkeletonizerText(
        text: _data[index].experiencesForJob,
      )),
      DataCell(SkeletonizerText(
        text: _data[index].gender,
      )),
      DataCell(SkeletonizerText(
        text: _data[index].jobTitle,
      )),
      DataCell(SkeletonizerText(
        text: _data[index].workTime,
      )),
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
