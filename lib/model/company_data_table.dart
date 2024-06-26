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
        companyData[index].id.toString(),
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
    (index) => CompanyModel(id: 'asddasdyrh5656'),
  );

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        SkeletonizerText(text: _data[index].id),
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
