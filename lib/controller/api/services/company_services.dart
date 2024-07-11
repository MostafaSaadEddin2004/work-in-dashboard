import 'dart:convert';
import 'dart:io';
import 'package:work_in_dashboard/controller/api/base_api_model.dart';
import 'package:work_in_dashboard/model/company_mode.dart';

abstract class CompanyServices extends BaseApi {
  static Future<List<CompanyModel>> getAllCompanies() async {
      try {
  final response = await BaseApi.getRequest(endPoint: 'CompanyForm');
  final data = (jsonDecode(response.body) as List)
      .map((e) => CompanyModel.fromJson(e))
      .toList();
  return data;
} on HttpException catch (e) {
    throw HttpException(e.message);
}
  }
}
