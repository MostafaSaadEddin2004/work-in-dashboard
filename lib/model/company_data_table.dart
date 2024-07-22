import 'package:flutter/material.dart';
import 'package:work_in_dashboard/model/company_mode.dart';
import 'package:work_in_dashboard/view/components/skeletonizer_text.dart';

class CompanyDataTable extends DataTableSource {
  final List<CompanyModel> companyData;
  CompanyDataTable({required this.companyData});

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
        isAdmin: true,
        id: 'sadasdasd',
        companyName: 'companyName',
        email: 'email',
        password: 'password',
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
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
