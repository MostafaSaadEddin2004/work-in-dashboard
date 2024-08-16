import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_in_dashboard/controller/bloc/company_service/company_services_cubit.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/model/company_mode.dart';
import 'package:work_in_dashboard/view/components/accept_button.dart';
import 'package:work_in_dashboard/view/components/skeletonizer_text.dart';

class CompanyDataTable extends DataTableSource {
  final List<CompanyModel> companyData;
  final BuildContext context;
  CompanyDataTable({required this.companyData, required this.context});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(
        companyData[index].companyName,
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        companyData[index].email,
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        companyData[index].phone,
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        companyData[index].companyField,
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        companyData[index].isAccepted.toString(),
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(companyData[index].isAccepted == false
          ? Row(
              children: [
                AcceptButton(
                    onPressed: () {
                      context
                          .read<CompanyServicesCubit>()
                          .acceptCompanyRequest(context, companyData[index].id);
                    },
                    text: 'Accept',
                    color: AppColor.blue),
                AcceptButton(
                    onPressed: () {
                      context
                          .read<CompanyServicesCubit>()
                          .rejectCompanyRequest(context, companyData[index].id);
                    },
                    text: 'Reject',
                    color: AppColor.red),
              ],
            )
          : const SizedBox()),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => companyData.length;

  @override
  int get selectedRowCount => 0;
}

class NullCompanyDataTable extends DataTableSource {
  final _data = List.generate(
    10,
    (index) => CompanyModel(
        isAdmin: false,
        isAccepted: false,
        id: 'sadasdasd',
        companyName: 'companyName',
        email: 'email',
        phone: 'phone',
        companyField: 'companyField',
        createdAt: DateTime(7, 22, 2024),
        updatedAt: DateTime(7, 22, 2024),
        v: 0,
        block: false),
  );

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        SkeletonizerText(text: _data[index].companyName),
      ),
      DataCell(
        SkeletonizerText(text: _data[index].email),
      ),
      DataCell(
        SkeletonizerText(text: _data[index].phone),
      ),
      DataCell(
        SkeletonizerText(text: _data[index].companyField),
      ),
      DataCell(
        SkeletonizerText(text: _data[index].isAccepted.toString()),
      ),
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
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
