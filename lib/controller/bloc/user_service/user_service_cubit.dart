import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:work_in_dashboard/controller/api/services/user_services.dart';
import 'package:work_in_dashboard/model/user_model.dart';

part 'user_service_state.dart';

class UserServiceCubit extends Cubit<UserServiceState> {
  UserServiceCubit() : super(UserServiceInitial());
  void getAllUsers()async{
    emit(UserServiceLoading());
    try {
     final userData = await UserServices.getAllUsers();
     emit(UserServiceFetched(userData: userData)); 
    } on HttpException catch (e) {
      emit(UserServiceFailure(errorMessage: e.message));
    }
  }
}
