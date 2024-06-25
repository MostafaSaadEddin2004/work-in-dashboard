import 'package:flutter/material.dart';
import 'package:work_in_dashboard/model/job_model.dart';

class JobdataTable extends DataTableSource {
  final List<JobModel> jobData;
  JobdataTable({required this.jobData});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(jobData[index].id,style: const TextStyle(fontSize: 14),)),
      DataCell(Text(jobData[index].companyName,style: const TextStyle(fontSize: 14),)),
      DataCell(Text(jobData[index].companyNav,style: const TextStyle(fontSize: 14),)),
      DataCell(Text(jobData[index].experiencesForJob,style: const TextStyle(fontSize: 14),)),
      DataCell(Text(jobData[index].gender,style: const TextStyle(fontSize: 14),)),
      DataCell(Text(jobData[index].jobTitle,style: const TextStyle(fontSize: 14),)),
      DataCell(Text(jobData[index].workTime,style: const TextStyle(fontSize: 14),)),
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
