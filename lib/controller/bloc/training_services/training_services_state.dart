part of 'training_services_cubit.dart';

@immutable
sealed class TrainingServicesState {}

final class TrainingServicesInitial extends TrainingServicesState {}

final class TrainingServicesLoading extends TrainingServicesState {}

final class TrainingServicesFetched extends TrainingServicesState {
  final List<TrainingModel> trainingData;

  TrainingServicesFetched({required this.trainingData});
}

final class TrainingServicesFailure extends TrainingServicesState {
  final String errorMessage;

  TrainingServicesFailure({required this.errorMessage});
}

final class TrainingServicesSuccess extends TrainingServicesState {}