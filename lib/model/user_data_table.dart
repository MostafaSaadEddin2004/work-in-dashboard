import 'package:flutter/material.dart';
import 'package:work_in_dashboard/model/user_model.dart';

class UserDataTable extends DataTableSource {
  final List<UserModel>? userData;
  UserDataTable({this.userData});

  // final _staticData = List.generate(5, (index) => {
    
  // });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(
          userData![index].id.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          userData![index].username.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          userData![index].email.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          userData![index].phone.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          userData![index].birthDate.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          userData![index].gender.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
      DataCell(
        Text(
          userData![index].isAdmin.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
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
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => userData!.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
