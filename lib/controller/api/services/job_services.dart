import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:work_in_dashboard/controller/api/base_api_model.dart';
import 'package:work_in_dashboard/model/job_model.dart';

abstract class JobServices extends BaseApi {
  static Future<List<JobModel>> getAllJobs() async {
    try {
      final response = await BaseApi.getRequest(endPoint: 'JobForm');
      final data = (jsonDecode(response.body) as List)
          .map((e) => JobModel.fromJson(e))
          .toList();
      return data;
    } on HttpException catch (e) {
      throw HttpException(e.message);
    }
  }

  static Future<void> addJob({
    required String companyName,
    required String jobTitle,
    required String experiencesForJob,
    required String workTime,
    required String companyNav,
    required String gender,
  }) async {
    try {
      await BaseApi.postRequest(endPoint: 'JobForm/Add-job', data: {
        'CompanyName': companyName,
        'JobTitle': jobTitle,
        'ExperiencesForJob': experiencesForJob,
        'WorkTime': workTime,
        'CompanyNav': companyNav,
        'Gender': gender,
      });
      Get.snackbar('Congrats!', 'Job has been added successfully');
    } on HttpException catch (e) {
      Get.snackbar('Warning!', e.message);
    }
  }

  static Future<void> updateJob({
    required String id,
    String? companyName,
    String? jobTitle,
    String? experiencesForJob,
    String? workTime,
    String? companyNav,
    String? gender,
  }) async {
    try {
      await BaseApi.putRequest(
          endPoint: 'JobForm/Update-Job',
          id: id,
          data: {
            'CompanyName': companyName,
            'JobTitle': jobTitle,
            'ExperiencesForJob': experiencesForJob,
            'WorkTime': workTime,
            'CompanyNav': companyNav,
            'Gender': gender,
          });
      Get.snackbar('Congrats!', 'Job has been updated successfully');
    } on HttpException catch (e) {
      Get.snackbar('Warning!', e.message);
      throw HttpException(e.message);
    }
  }

  static Future<void> deleteJob({required String id}) async {
    try {
      await BaseApi.deleteRequest(endPoint: 'JobForm/Delete-job', id: id);
      Get.snackbar('Congrats!', 'Job has been deleted successfully');
    } on HttpException catch (e) {
      Get.snackbar('Warning!', e.message);
    }
  }
}
