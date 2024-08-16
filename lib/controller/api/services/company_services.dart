import 'dart:convert';
import 'package:work_in_dashboard/controller/api/base_api_model.dart';
import 'package:work_in_dashboard/model/company_mode.dart';

abstract class CompanyServices extends BaseApi {
  static Future<List<CompanyModel>> getAllCompanies() async {
    final response = await BaseApi.getRequest(endPoint: 'All_companies');
    final data = (jsonDecode(response.body) as List)
        .map((e) => CompanyModel.fromJson(e))
        .toList();
    return data;
  }

  static Future<void> acceptCompanyRequest({required String companyId}) async {
    await BaseApi.postRequest(
        endPoint: 'company/$companyId/accept', data: {'isAccepted': true});
  }

  static Future<void> rejectCompanyRequest({required String companyId}) async {
    await BaseApi.postRequest(
        endPoint: 'company/$companyId/accept', data: {'isAccepted': false});
  }
}
