import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:work_in_dashboard/controller/bloc/job_services/job_services_cubit.dart';
import 'package:work_in_dashboard/controller/constants/nav_items.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/model/job_model.dart';
import 'package:work_in_dashboard/view/components/skeletonizer_text.dart';

class JobdataTable extends DataTableSource {
  final List<JobModel> jobData;
  final BuildContext context;
  JobdataTable({
    required this.jobData,
    required this.context,
  });
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(
          jobData[index].companyName,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          jobData[index].companyNav,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          jobData[index].experiencesForJob,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          jobData[index].gender,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          jobData[index].jobTitle,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          jobData[index].workTime,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                context.goNamed(NavItemsName.updateJobName, queryParameters: {
                  'jobId': jobData[index].id,
                  'companyName': jobData[index].companyName,
                  'Email': jobData[index].email,
                  'Phone': jobData[index].phone,
                  'jobTitle': jobData[index].jobTitle,
                  'experiencesForJob': jobData[index].experiencesForJob,
                  'workTime': jobData[index].workTime,
                  'location': jobData[index].companyNav,
                  'gender': jobData[index].gender,
                });
              },
              icon: const Icon(
                Icons.edit_rounded,
                size: 25,
              )),
          IconButton(
              onPressed: () {
                context
                    .read<JobServicesCubit>()
                    .deleteJob(context, jobData[index].id);
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
          email: 'asdasdasd@gmail.com',
          phone: '0965965659',
          jobTitle: 'jobTitle',
          experiencesForJob: 'experiencesForJob',
          workTime: 'workTime',
          companyNav: 'companyNav',
          gender: 'gender',
          createdAt: DateTime(2024, 6, 25),
          updatedAt: DateTime(2024, 6, 25),
          version: 0));
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
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
