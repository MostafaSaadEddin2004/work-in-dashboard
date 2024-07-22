part of 'job_services_cubit.dart';

@immutable
sealed class JobServicesState {}

final class JobServicesInitial extends JobServicesState {}

final class JobServicesLoading extends JobServicesState {}

final class JobServicesFetched extends JobServicesState {
  final List<JobModel> jobData;

  JobServicesFetched({required this.jobData});
}

final class JobServicesFailure extends JobServicesState {
  final String errorMessage;

  JobServicesFailure({required this.errorMessage});
}

final class JobServicesSuccess extends JobServicesState {}