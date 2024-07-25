import 'dart:convert';
import 'package:work_in_dashboard/controller/api/base_api_model.dart';
import 'package:work_in_dashboard/model/company_mode.dart';
import 'package:work_in_dashboard/model/company_request_model.dart';

abstract class CompanyServices extends BaseApi {
  static Future<List<CompanyModel>> getAllCompanies() async {
  final response = await BaseApi.getRequest(endPoint: 'dashboard/All_companies');
  final data = (jsonDecode(response.body) as List)
      .map((e) => CompanyModel.fromJson(e))
      .toList();
  return data;
  }

  static Future<List<CompanyRequestModel>> getAllCompaniesRequests() async {
  final response = await BaseApi.getRequest(endPoint: 'dashboard/All_companies');
  final data = (jsonDecode(response.body) as List)
      .map((e) => CompanyRequestModel.fromJson(e))
      .toList();
  return data;
  }

  static Future<void> acceptCompanyRequest()async{
    await BaseApi.postRequest(endPoint: 'accept',data: {});
  }

  static Future<void> rejectCompanyRequest()async{
    await BaseApi.postRequest(endPoint: 'reject',data: {});
  }
}
