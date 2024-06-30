import 'dart:convert';
import 'dart:io';
import 'package:work_in_dashboard/controller/api/base_api_model.dart';
import 'package:work_in_dashboard/model/training_model.dart';

abstract class TrainingServices extends BaseApi {
  static Future<List<TrainingModel>> getAllTraining() async {
    final response = await BaseApi.getRequest(endPoint: 'TrainingForm');
    final data = (jsonDecode(response.body) as List)
        .map((e) => TrainingModel.fromJson(e))
        .toList();
    return data;
  }

  static Future<String> addTraining({
    required String trainingCompany,
    required String kindOfTrain,
    required String location,
  }) async {
    try {
      final response =
          await BaseApi.postRequest(endPoint: 'TrainingForm/Add-Train', data: {
        'TrainingCompany': trainingCompany,
        'KindOfTrain': kindOfTrain,
        'Location': location,
      });
      print(response.body);
      return 'Job has been added successfully';
    } on HttpException catch (e) {
      return e.message;
    }
  }

  static Future<String> updateTraining({
    required String id,
    required String trainingCompany,
    required String kindOfTrain,
    required String location,
  }) async {
    try {
      final response =
          await BaseApi.putRequest(endPoint: 'TrainingForm/Update-Train/$id',id: id, data: {
        'TrainingCompany': trainingCompany,
        'KindOfTrain': kindOfTrain,
        'Location': location,
      });
      print(response.body);
      return 'Job has been updated successfully';
    } on HttpException catch (e) {
      return e.message;
    }
  }

  static Future<String> deleteTraining({required String id}) async {
    try {
      await BaseApi.deleteRequest(endPoint: 'TrainingForm/Delete-Train/$id', id: id);
      return 'Job has been deleted successfully';
    } on HttpException catch (e) {
      return e.message;
    }
  }
}
