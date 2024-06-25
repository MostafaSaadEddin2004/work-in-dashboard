
import 'dart:convert';

import 'package:work_in_dashboard/controller/api/base_api_model.dart';
import 'package:work_in_dashboard/model/training_model.dart';

abstract class TrainingServices extends BaseApi{
  static Future<List<TrainingModel>> getAllTraining()async{
    final response = await BaseApi.getRequest(endPoint: 'TrainingForm');
    final data = (jsonDecode(response.body) as List).map((e) => TrainingModel.fromJson(e)).toList();
    return data;
  }
}