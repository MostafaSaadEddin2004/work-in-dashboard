import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/api/services/company_services.dart';
import 'package:work_in_dashboard/model/company_mode.dart';

part 'company_services_state.dart';

class CompanyServicesCubit extends Cubit<CompanyServicesState> {
  CompanyServicesCubit() : super(CompanyServicesInitial());
  void getAllCompanies() async {
    emit(CompanyServicesLoading());
    try {
      final companyData = await CompanyServices.getAllCompanies();
      emit(CompanyServicesFetched(companyData: companyData));
    } on HttpException catch (e) {
      emit(CompanyServicesFailure(errorMessage: e.message));
    }
  }
}
