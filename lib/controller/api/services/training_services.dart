import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:work_in_dashboard/controller/api/base_api_model.dart';
import 'package:work_in_dashboard/model/training_model.dart';

abstract class TrainingServices extends BaseApi {
  static Future<List<TrainingModel>> getAllTraining() async {
    try {
      final response = await BaseApi.getRequest(endPoint: 'TrainingForm');
      final data = (jsonDecode(response.body) as List)
          .map((e) => TrainingModel.fromJson(e))
          .toList();
      return data;
    } on HttpException catch (e) {
      throw HttpException(e.message);
    }
  }

  static Future<void> addTraining({
    required String trainingCompany,
    required String kindOfTrain,
    required String location,
  }) async {
    try {
      await BaseApi.postRequest(endPoint: 'TrainingForm/Add-Train', data: {
        'TrainingCompany': trainingCompany,
        'KindOfTrain': kindOfTrain,
        'Location': location,
      });
      Get.snackbar('Congrats!', 'Training has been added successfully');
    } on HttpException catch (e) {
      Get.snackbar('Warning!', e.message);
    }
  }

  static Future<void> updateTraining({
    required String id,
    String? trainingCompany,
    String? kindOfTrain,
    String? location,
  }) async {
    try {
      await BaseApi.putRequest(
          endPoint: 'TrainingForm/Update-Train',
          id: id,
          data: {
            'TrainingCompany': trainingCompany,
            'KindOfTrain': kindOfTrain,
            'Location': location,
          });
      Get.snackbar('Congrats!', 'Training has been updated successfully');
    } on HttpException catch (e) {
      Get.snackbar('Warning!', e.message);
    }
  }

  static Future<void> deleteTraining({required String id}) async {
    try {
      await BaseApi.deleteRequest(
          endPoint: 'TrainingForm/Delete-Train', id: id);
      Get.snackbar('Congrats!', 'Training has been deleted successfully');
    } on HttpException catch (e) {
      Get.snackbar('Warning!', e.message);
    }
  }
}
