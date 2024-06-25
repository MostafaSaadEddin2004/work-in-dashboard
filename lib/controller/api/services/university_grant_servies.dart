import 'dart:convert';
import 'package:work_in_dashboard/controller/api/base_api_model.dart';
import 'package:work_in_dashboard/model/university_grant_model.dart';

abstract class UniversityGrantServices extends BaseApi {
  static Future<List<UniversityGrantModel>> getAllGrants() async {
    final response = await BaseApi.getRequest(endPoint: 'UniversityForm');
    final data = (jsonDecode(response.body) as List)
        .map((e) => UniversityGrantModel.fromJson(e))
        .toList();
    return data;
  }
}
