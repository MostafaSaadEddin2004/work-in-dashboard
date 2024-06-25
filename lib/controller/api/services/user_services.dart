import 'dart:convert';

import 'package:work_in_dashboard/controller/api/base_api_model.dart';
import 'package:work_in_dashboard/model/user_model.dart';

abstract class UserServices extends BaseApi {
  static Future<List<UserModel>> getAllUsers() async {
    final response = await BaseApi.getRequest(endPoint: 'users');
    final data = (jsonDecode(response.body) as List)
        .map((e) => UserModel.fromJson(e))
        .toList();
    return data;
  }
}
