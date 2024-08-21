import 'dart:convert';
import 'dart:io';
import 'package:work_in_dashboard/controller/api/base_api_model.dart';
import 'package:work_in_dashboard/model/job_model.dart';

class JobServices extends BaseApi {
  static Future<List<JobModel>> getAllJobs() async {
    try {
      final response = await BaseApi.getRequest(endPoint: 'All_jobs');
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
    required String companyEmail,
    required String companyPhone,
    required String jobTitle,
    required String experiencesForJob,
    required String workTime,
    required String companyNav,
    required String gender,
  }) async {
    await BaseApi.postRequest(endPoint: 'Add-job', data: {
      'CompanyName': companyName,
      'Email': companyEmail,
      'Phone': companyPhone,
      'JobTitle': jobTitle,
      'ExperiencesForJob': experiencesForJob,
      'WorkTime': workTime,
      'CompanyNav': companyNav,
      'Gender': gender,
    });
  }

  static Future<void> updateJob({
    required String id,
    String? companyName,
    String? companyEmail,
    String? companyPhone,
    String? jobTitle,
    String? experiencesForJob,
    String? workTime,
    String? companyNav,
    String? gender,
  }) async {
    await BaseApi.putRequest(endPoint: 'Update-Job', id: id, data: {
      'CompanyName': jsonEncode(companyName),
      'Email': jsonEncode(companyEmail),
      'Phone': jsonEncode(companyPhone),
      'JobTitle': jsonEncode(jobTitle),
      'ExperiencesForJob': jsonEncode(experiencesForJob),
      'WorkTime': jsonEncode(workTime),
      'CompanyNav': jsonEncode(companyNav),
      'Gender': jsonEncode(gender),
    });
  }

  static Future<void> deleteJob({required String id}) async {
    await BaseApi.deleteRequest(endPoint: 'Delete-job', id: id);
  }
}
