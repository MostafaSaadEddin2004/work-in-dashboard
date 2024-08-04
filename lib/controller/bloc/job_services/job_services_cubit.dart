import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/api/services/job_services.dart';
import 'package:work_in_dashboard/controller/utilities/snack.dart';
import 'package:work_in_dashboard/model/job_model.dart';

part 'job_services_state.dart';

class JobServicesCubit extends Cubit<JobServicesState> {
  JobServicesCubit() : super(JobServicesInitial());

  void getAllJobs() async {
    emit(JobServicesLoading());
    try {
      final jobData = await JobServices.getAllJobs();
      emit(JobServicesFetched(jobData: jobData));
    } on HttpException catch (e) {
      emit(JobServicesFailure(errorMessage: e.message));
    }
  }

  void addJob(
      BuildContext context,
      String companyName,
      String jobTitle,
      String experiencesForJob,
      String workTime,
      String companyNav,
      String gender) async {
    emit(JobServicesLoading());
    try {
      await JobServices.addJob(
          companyName: companyName,
          jobTitle: jobTitle,
          experiencesForJob: experiencesForJob,
          workTime: workTime,
          companyNav: companyNav,
          gender: gender);
      emit(JobServicesSuccess());
      Snack.showSnack(context, 'Congrats!', 'Job has been added successfully');
    } on HttpException catch (e) {
      emit(JobServicesFailure(errorMessage: e.message));
      Snack.showSnack(context, 'Warning!', e.message);
    }
  }

  void updateJob(
      BuildContext context,
      String id,
      String companyName,
      String jobTitle,
      String experiencesForJob,
      String workTime,
      String companyNav,
      String gender) async {
    emit(JobServicesLoading());
    try {
      await JobServices.updateJob(
          id: id,
          companyName: companyName,
          jobTitle: jobTitle,
          experiencesForJob: experiencesForJob,
          workTime: workTime,
          companyNav: companyNav,
          gender: gender);
      emit(JobServicesSuccess());
      Snack.showSnack(
          context, 'Congrats!', 'Job has been updated successfully');
    } on HttpException catch (e) {
      emit(JobServicesFailure(errorMessage: e.message));
      Snack.showSnack(context, 'Warning!', e.message);
    }
  }

  void deleteJob(BuildContext context, String id) async {
    emit(JobServicesLoading());
    try {
      await JobServices.deleteJob(id: id);
      emit(JobServicesSuccess());
      Snack.showSnack(
          context, 'Congrats!', 'Job has been deleted successfully');
    } on HttpException catch (e) {
      emit(JobServicesFailure(errorMessage: e.message));
      Snack.showSnack(context, 'Warning!', e.message);
      print(e.message);
    }
  }
}
