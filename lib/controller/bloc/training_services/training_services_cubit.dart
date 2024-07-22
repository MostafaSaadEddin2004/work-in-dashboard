import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/api/services/training_services.dart';
import 'package:work_in_dashboard/controller/utilities/snack.dart';
import 'package:work_in_dashboard/model/training_model.dart';

part 'training_services_state.dart';

class TrainingServicesCubit extends Cubit<TrainingServicesState> {
  TrainingServicesCubit() : super(TrainingServicesInitial());

  void getAllTraining() async {
    emit(TrainingServicesLoading());
    try {
      final trainingData = await TrainingServices.getAllTraining();
      emit(TrainingServicesFetched(trainingData: trainingData));
    } on HttpException catch (e) {
      emit(TrainingServicesFailure(errorMessage: e.message));
    }
  }

  void addTraining(
    BuildContext context,
    String kindOfTrain,
    String location,
    String trainingCompany,
  ) {
    emit(TrainingServicesLoading());
    try {
      TrainingServices.addTraining(
        kindOfTrain: kindOfTrain,
        location: location,
        trainingCompany: trainingCompany,
      );
      emit(TrainingServicesSuccess());
      Snack.showSnack(context, 'Congrats!', 'Job has been added successfully');
    } on HttpException catch (e) {
      emit(TrainingServicesFailure(errorMessage: e.message));
      Snack.showSnack(context, 'Warning!', e.message);
    }
  }

  void updateTraining(
    BuildContext context,
    String id,
    String kindOfTrain,
    String location,
    String trainingCompany,
  ) {
    emit(TrainingServicesLoading());
    try {
      TrainingServices.updateTraining(
        id: id,
        kindOfTrain: kindOfTrain,
        location: location,
        trainingCompany: trainingCompany,
      );
      emit(TrainingServicesSuccess());
      Snack.showSnack(
          context, 'Congrats!', 'Job has been updated successfully');
    } on HttpException catch (e) {
      emit(TrainingServicesFailure(errorMessage: e.message));
      Snack.showSnack(context, 'Warning!', e.message);
    }
  }

  void deleteTraining(BuildContext context, String id) {
    emit(TrainingServicesLoading());
    try {
      TrainingServices.deleteTraining(id: id);
      emit(TrainingServicesSuccess());
      Snack.showSnack(
          context, 'Congrats!', 'Job has been deleted successfully');
    } on HttpException catch (e) {
      emit(TrainingServicesFailure(errorMessage: e.message));
      Snack.showSnack(context, 'Congrats!', e.message);
    }
  }
}
