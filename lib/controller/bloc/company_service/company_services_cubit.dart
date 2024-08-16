import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/api/services/company_services.dart';
import 'package:work_in_dashboard/controller/utilities/snack.dart';
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

  void acceptCompanyRequest(BuildContext context, String companyId) async {
    emit(CompanyServicesLoading());
    try {
      await CompanyServices.acceptCompanyRequest(companyId: companyId);

      Snack.showSnack(context, 'Congrats!',
          "Company request has been accepted successully");
      emit(CompanyServicesSuccess());
    } on HttpException catch (e) {
      Snack.showSnack(context, 'Warning!', e.message);
      emit(CompanyServicesFailure(errorMessage: e.message));
    }
  }

  void rejectCompanyRequest(BuildContext context, String companyId) async {
    emit(CompanyServicesLoading());
    try {
      await CompanyServices.rejectCompanyRequest(companyId: companyId);
      Snack.showSnack(context, 'Congrats!',
          "Company request has been rejected successully");
      emit(CompanyServicesSuccess());
    } on HttpException catch (e) {
      Snack.showSnack(context, 'Warning!', e.message);
      emit(CompanyServicesFailure(errorMessage: e.message));
    }
  }

}
