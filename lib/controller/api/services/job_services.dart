import 'dart:convert';

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
}
