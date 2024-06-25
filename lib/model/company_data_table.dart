import 'package:flutter/material.dart';
import 'package:work_in_dashboard/model/company_mode.dart';

class CompanyDataTable extends DataTableSource {
  final List<CompanyModel> companyData;
  CompanyDataTable({required this.companyData});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(
        companyData[index].id.toString(),
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mode_edit_rounded,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_rounded,
                size: 25,
              )),
        ],
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
