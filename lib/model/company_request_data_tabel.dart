import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_in_dashboard/controller/bloc/companies_requests_services/companies_requests_services_cubit.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/model/company_request_model.dart';
import 'package:work_in_dashboard/view/components/accept_button.dart';
import 'package:work_in_dashboard/view/components/skeletonizer_text.dart';

class CompanyRequestDataTabel extends DataTableSource {
  final List<CompanyRequestModel> companiesRequestsData;
  final bool isLoading;
  final BuildContext context;

  CompanyRequestDataTabel({
    required this.companiesRequestsData,
    required this.isLoading,
    required this.context,
  });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(companiesRequestsData[index].id)),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AcceptButton(
              onPressed: () {
                context
                    .read<CompaniesRequestsServicesCubit>()
                    .acceptCompanyRequest(context);
              },
              text: 'Accept',
              color: AppColor.blue),
          const SizedBox(
            width: 8,
          ),
          AcceptButton(
              onPressed: () {
                context
                    .read<CompaniesRequestsServicesCubit>()
                    .rejectCompanyRequest(context);
              },
              text: 'Reject',
              color: AppColor.red),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => companiesRequestsData.length;

  @override
  int get selectedRowCount => 0;
}

class NullCompanyRequestDataTabel extends DataTableSource {
  final companiesRequestsData =
      List.generate(5, (index) => CompanyRequestModel(id: 'saddsafdsfsd'));

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(SkeletonizerText(
        text: companiesRequestsData[index].id,
      )),
      DataCell(Row(
        children: [
          AcceptButton(onPressed: () {}, text: 'Accept', color: AppColor.blue),
          AcceptButton(onPressed: () {}, text: 'Reject', color: AppColor.red),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => companiesRequestsData.length;

  @override
  int get selectedRowCount => 0;
}
