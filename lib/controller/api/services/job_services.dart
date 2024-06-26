import 'dart:convert';
import 'dart:io';
import 'package:work_in_dashboard/controller/api/base_api_model.dart';
import 'package:work_in_dashboard/model/job_model.dart';

abstract class JobServices extends BaseApi {
  static Future<List<JobModel>> getAllJobs() async {
    final response = await BaseApi.getRequest(endPoint: 'JobForm');
    final data = (jsonDecode(response.body) as List)
        .map((e) => JobModel.fromJson(e))
        .toList();
    return data;
  }

  static Future<String> addJob({
    required String companyName,
    required String jobTitle,
    required String experiencesForJob,
    required String workTime,
    required String companyNav,
    required String gender,
  }) async {
    try {
      final response =
          await BaseApi.postRequest(endPoint: 'JobForm/Add-job', data: {
        'CompanyName': companyName,
        'JobTitle': jobTitle,
        'ExperiencesForJob': experiencesForJob,
        'WorkTime': workTime,
        'CompanyNav': companyNav,
        'Gender': gender,
      });
      print(response.body);
      return 'Job has been added successfully';
    } on HttpException catch (e) {
      return e.message;
    }
  }

  static Future<String> updateJob({
    required String id,
    String? companyName,
    String? jobTitle,
    String? experiencesForJob,
    String? workTime,
    String? companyNav,
    String? gender,
  }) async {
    try {
      final response =
          await BaseApi.putRequest(endPoint: 'JobForm/Update-Job',id: id, data: {
        'CompanyName': companyName,
        'JobTitle': jobTitle,
        'ExperiencesForJob': experiencesForJob,
        'WorkTime': workTime,
        'CompanyNav': companyNav,
        'Gender': gender,
      });
      print(response.body);
      return 'Job has been updated successfully';
    } on HttpException catch (e) {
      return e.message;
    }
  }

  static Future<String>  deleteJob({required  String id})async{
    try {
      await BaseApi.deleteRequest(endPoint: 'JobForm/Delete-job', id: id);
      return 'Job has been deleted successfully';
    } on HttpException catch (e) {
        return e.message;
    }
  }
}
