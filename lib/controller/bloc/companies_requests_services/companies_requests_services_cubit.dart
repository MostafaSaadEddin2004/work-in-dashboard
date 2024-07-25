import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:work_in_dashboard/controller/api/services/company_services.dart';
import 'package:work_in_dashboard/controller/utilities/snack.dart';
import 'package:work_in_dashboard/model/company_request_model.dart';

part 'companies_requests_services_state.dart';

class CompaniesRequestsServicesCubit
    extends Cubit<CompaniesRequestsServicesState> {
  CompaniesRequestsServicesCubit() : super(CompaniesRequestsServicesInitial());

  void getAllCompaniesRequests() async {
    emit(CompaniesRequestsServicesLoading());
    try {
      final companyRequestData =
          await CompanyServices.getAllCompaniesRequests();
      emit(CompaniesRequestsServicesFetched(
          companyRequestData: companyRequestData));
    } on HttpException catch (e) {
      emit(CompaniesRequestsServicesFailure(errorMessage: e.message));
    }
  }

  void acceptCompanyRequest(BuildContext context) async {
    emit(CompaniesRequestsServicesLoading());
    try {
      await CompanyServices.acceptCompanyRequest();

      Snack.showSnack(context, 'Congrats!',
          "Company request has been accepted successully");
      emit(CompaniesRequestsServicesSuccess());
    } on HttpException catch (e) {
      Snack.showSnack(context, 'Warning!', e.message);
      emit(CompaniesRequestsServicesFailure(errorMessage: e.message));
    }
  }

  void rejectCompanyRequest(BuildContext context) async {
    emit(CompaniesRequestsServicesLoading());
    try {
      await CompanyServices.rejectCompanyRequest();
      Snack.showSnack(context, 'Congrats!',
          "Company request has been rejected successully");
      emit(CompaniesRequestsServicesSuccess());
    } on HttpException catch (e) {
      Snack.showSnack(context, 'Warning!', e.message);
      emit(CompaniesRequestsServicesFailure(errorMessage: e.message));
    }
  }
}
