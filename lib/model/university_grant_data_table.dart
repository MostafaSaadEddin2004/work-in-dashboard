import 'package:flutter/material.dart';

class UniversityGrantsDataTable extends DataTableSource{
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text('s')),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => 0;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}