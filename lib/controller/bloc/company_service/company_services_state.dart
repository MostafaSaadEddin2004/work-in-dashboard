part of 'company_services_cubit.dart';

@immutable
sealed class CompanyServicesState {}

final class CompanyServicesInitial extends CompanyServicesState {}

final class CompanyServicesLoading extends CompanyServicesState {}

final class CompanyServicesFetched extends CompanyServicesState {
  final List<CompanyModel> companyData;

  CompanyServicesFetched({required this.companyData});
}

final class CompanyServicesFailure extends CompanyServicesState {
  final String errorMessage;

  CompanyServicesFailure({required this.errorMessage});
}

final class CompanyServicesSuccess extends CompanyServicesState{}