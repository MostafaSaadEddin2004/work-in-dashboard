import 'package:flutter/material.dart';

class UserDataTable extends DataTableSource {
  final _data = List.generate(
      100,
      (index) => {
            'fullname': 'Full name $index',
            'user_experience': 'User Experience $index',
            'email': 'email $index',
            'phone': 'phone $index',
            'age': 'Age $index',
            'current_address': 'Current address $index',
          });
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(
          _data[index]['fullname'].toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          _data[index]['user_experience'].toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          _data[index]['email'].toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          _data[index]['phone'].toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          _data[index]['age'].toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          _data[index]['current_address'].toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
