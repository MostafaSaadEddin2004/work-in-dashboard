part of 'companies_requests_services_cubit.dart';

@immutable
sealed class CompaniesRequestsServicesState {}

final class CompaniesRequestsServicesInitial
    extends CompaniesRequestsServicesState {}

final class CompaniesRequestsServicesLoading
    extends CompaniesRequestsServicesState {}

final class CompaniesRequestsServicesFetched
    extends CompaniesRequestsServicesState {
  final List<CompanyRequestModel> companyRequestData;

  CompaniesRequestsServicesFetched({required this.companyRequestData});
}

final class CompaniesRequestsServicesFailure
    extends CompaniesRequestsServicesState {
  final String errorMessage;

  CompaniesRequestsServicesFailure({required this.errorMessage});
}

final class CompaniesRequestsServicesSuccess
    extends CompaniesRequestsServicesState {}
