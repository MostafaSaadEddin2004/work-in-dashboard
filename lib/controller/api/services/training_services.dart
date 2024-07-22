import 'dart:convert';
import 'package:work_in_dashboard/controller/api/base_api_model.dart';
import 'package:work_in_dashboard/model/training_model.dart';

class TrainingServices extends BaseApi {
  static Future<List<TrainingModel>> getAllTraining() async {
    final response = await BaseApi.getRequest(endPoint: 'TrainingForm');
    final data = (jsonDecode(response.body) as List)
        .map((e) => TrainingModel.fromJson(e))
        .toList();
    return data;
  }

  static Future<void> addTraining({
    required String trainingCompany,
    required String kindOfTrain,
    required String location,
  }) async {
    await BaseApi.postRequest(endPoint: 'TrainingForm/Add-Train', data: {
      'TrainingCompany': trainingCompany,
      'KindOfTrain': kindOfTrain,
      'Location': location,
    });
  }

  static Future<void> updateTraining({
    required String id,
    String? trainingCompany,
    String? kindOfTrain,
    String? location,
  }) async {
    await BaseApi.putRequest(
        endPoint: 'TrainingForm/Update-Train',
        id: id,
        data: {
          'TrainingCompany': trainingCompany,
          'KindOfTrain': kindOfTrain,
          'Location': location,
        });
  }

  static Future<void> deleteTraining({required String id}) async {
    await BaseApi.deleteRequest(endPoint: 'TrainingForm/Delete-Train', id: id);
  }
}
