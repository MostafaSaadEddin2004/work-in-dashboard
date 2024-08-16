import 'dart:convert';
import 'package:work_in_dashboard/controller/api/base_api_model.dart';
import 'package:work_in_dashboard/model/training_model.dart';

class TrainingServices extends BaseApi {
  static Future<List<TrainingModel>> getAllTraining() async {
    final response = await BaseApi.getRequest(endPoint: 'All_Training');
    final data = (jsonDecode(response.body) as List)
        .map((e) => TrainingModel.fromJson(e))
        .toList();
    return data;
  }

  static void addTraining({
    required String trainingCompany,
    required String companyEmail,
    required String companyPhone,
    required String kindOfTrain,
    required String location,
  }) async {
    await BaseApi.postRequest(endPoint: 'Add-Train', data: {
      'TrainingCompany': jsonEncode(trainingCompany),
      'Email': jsonEncode(companyEmail),
      'Phone': jsonEncode(companyPhone),
      'KindOfTrain': jsonEncode(kindOfTrain),
      'Location': jsonEncode(location),
    });
  }

  static Future<void> updateTraining({
    required String id,
    String? trainingCompany,
    String? companyEmail,
    String? companyPhone,
    String? kindOfTrain,
    String? location,
  }) async {
    await BaseApi.putRequest(endPoint: 'Update-Train', id: id, data: {
      'TrainingCompany': jsonEncode(trainingCompany),
      'Email': jsonEncode(companyEmail),
      'Phone': jsonEncode(companyPhone),
      'KindOfTrain': jsonEncode(kindOfTrain),
      'Location': jsonEncode(location),
    });
  }

  static Future<void> deleteTraining({required String id}) async {
    await BaseApi.deleteRequest(endPoint: 'Delete-Train', id: id);
  }
}
