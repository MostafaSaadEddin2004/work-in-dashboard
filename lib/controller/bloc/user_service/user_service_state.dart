part of 'user_service_cubit.dart';

@immutable
sealed class UserServiceState {}

final class UserServiceInitial extends UserServiceState {}

final class UserServiceLoading extends UserServiceState {}

final class UserServiceFetched extends UserServiceState {
  final List<UserModel> userData;

  UserServiceFetched({required this.userData});
}

final class UserServiceFailure extends UserServiceState {
  final String errorMessage;

  UserServiceFailure({required this.errorMessage});
}
