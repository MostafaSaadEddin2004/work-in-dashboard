import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_in_dashboard/controller/api/services/job_services.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/model/job_model.dart';
import 'package:work_in_dashboard/view/components/add_button.dart';
import 'package:work_in_dashboard/view/components/gender_radio_buttons.dart';
import 'package:work_in_dashboard/view/components/info_text_field.dart';
import 'package:work_in_dashboard/view/components/skeletonizer_text.dart';

class JobdataTable extends DataTableSource {
  final List<JobModel> jobData;
  JobdataTable({required this.jobData});

  final _companyName = TextEditingController();
  final _jobTitle = TextEditingController();
  final _experiencesForJob = TextEditingController();
  final _workTime = TextEditingController();
  final _location = TextEditingController();
  int selectedGender = 1;
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(
          jobData[index].companyName,
          style: const TextStyle(fontSize: 14),
        ),
        showEditIcon: true,
        onTap: () {
          _companyName.text = jobData[index].companyName;
          Get.defaultDialog(
            title: 'Edit company name',
            content: InfoTextField(
              controller: _companyName,
              labelText: 'Company name',
              hintText: 'Enter company name',
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
                await JobServices.updateJob(
                    id: jobData[index].id,
                    companyName: _companyName.text,
                    companyNav: jobData[index].companyNav,
                    experiencesForJob: jobData[index].experiencesForJob,
                    gender: jobData[index].gender,
                    jobTitle: jobData[index].jobTitle,
                    workTime: jobData[index].workTime);
                Get.back();
              },
            ),
          );
        },
      ),
      DataCell(
        Text(
          jobData[index].companyNav,
          style: const TextStyle(fontSize: 14),
        ),
        showEditIcon: true,
        onTap: () {
          _jobTitle.text = jobData[index].companyNav;
          Get.defaultDialog(
            title: 'Edit location',
            content: InfoTextField(
              controller: _jobTitle,
              labelText: 'Location',
              hintText: 'Enter location',
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
                await JobServices.updateJob(
                    id: jobData[index].id,
                    companyName: jobData[index].companyName,
                    companyNav: _companyName.text,
                    experiencesForJob: jobData[index].experiencesForJob,
                    gender: jobData[index].gender,
                    jobTitle: jobData[index].jobTitle,
                    workTime: jobData[index].workTime);
                Get.back();
              },
            ),
          );
        },
      ),
      DataCell(
        Text(
          jobData[index].experiencesForJob,
          style: const TextStyle(fontSize: 14),
        ),
        showEditIcon: true,
        onTap: () {
          _experiencesForJob.text = jobData[index].experiencesForJob;
          Get.defaultDialog(
            title: 'Edit required experiences',
            content: InfoTextField(
              controller: _experiencesForJob,
              labelText: 'Required experiences',
              hintText: 'Enter required experiences',
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
                await JobServices.updateJob(
                  id: jobData[index].id,
                  companyName: jobData[index].companyName,
                  companyNav: jobData[index].companyNav,
                  experiencesForJob: _experiencesForJob.text,
                  gender: jobData[index].gender,
                  jobTitle: jobData[index].jobTitle,
                  workTime: jobData[index].workTime,
                );
                Get.back();
              },
            ),
          );
        },
      ),
      DataCell(
        Text(
          jobData[index].gender,
          style: const TextStyle(fontSize: 14),
        ),
        showEditIcon: true,
        onTap: () {
          Get.defaultDialog(
            title: 'Edit gender',
            content: GenderRadioButton(
              selectedRadio: jobData[index].gender == 'male' ? 1 : 2,
              onChanged: (value) {
                selectedGender = value!;
              },
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
                await JobServices.updateJob(
                  id: jobData[index].id,
                  companyName: jobData[index].companyName,
                  companyNav: jobData[index].companyNav,
                  experiencesForJob: jobData[index].experiencesForJob,
                  gender: selectedGender == 1 ? 'male' : 'female',
                  jobTitle: jobData[index].jobTitle,
                  workTime: jobData[index].workTime,
                );
                Get.back();
              },
            ),
          );
        },
      ),
      DataCell(
        Text(
          jobData[index].jobTitle,
          style: const TextStyle(fontSize: 14),
        ),
        showEditIcon: true,
        onTap: () {
          _location.text = jobData[index].jobTitle;
          Get.defaultDialog(
            title: 'Edit job title',
            content: InfoTextField(
              controller: _location,
              labelText: 'Job title',
              hintText: 'Enter job title',
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
                await JobServices.updateJob(
                  id: jobData[index].id,
                  companyName: jobData[index].companyName,
                  companyNav: jobData[index].companyNav,
                  experiencesForJob: jobData[index].experiencesForJob,
                  gender: jobData[index].gender,
                  jobTitle: _jobTitle.text,
                  workTime: jobData[index].workTime,
                );
                Get.back();
              },
            ),
          );
        },
      ),
      DataCell(
        Text(
          jobData[index].workTime,
          style: const TextStyle(fontSize: 14),
        ),
        showEditIcon: true,
        onTap: () {
          _workTime.text = jobData[index].workTime;
          Get.defaultDialog(
            title: 'Edit work time',
            content: InfoTextField(
              controller: _workTime,
              labelText: 'Work time',
              hintText: 'Enter work time',
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
                await JobServices.updateJob(
                  id: jobData[index].id,
                  companyName: jobData[index].companyName,
                  companyNav: jobData[index].companyNav,
                  experiencesForJob: jobData[index].experiencesForJob,
                  gender: jobData[index].gender,
                  jobTitle: jobData[index].jobTitle,
                  workTime: _workTime.text,
                );
                Get.back();
              },
            ),
          );
        },
      ),
      DataCell(IconButton(
          onPressed: () async {
            await JobServices.deleteJob(id: jobData[index].id);
          },
          icon: const Icon(
            Icons.delete_rounded,
            size: 25,
            color: AppColor.red,
          ))),
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
