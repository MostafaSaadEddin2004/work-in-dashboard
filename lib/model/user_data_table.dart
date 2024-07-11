import 'package:flutter/material.dart';
import 'package:work_in_dashboard/model/user_model.dart';
import 'package:work_in_dashboard/view/components/skeletonizer_text.dart';

class UserDataTable extends DataTableSource {
  final List<UserModel> userData;
  UserDataTable({required this.userData});
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(
        userData[index].username.toString(),
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        userData[index].email.toString(),
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        userData[index].phone.toString(),
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        userData[index].birthDate.toString(),
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        userData[index].gender.toString(),
        style: const TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        userData[index].isAdmin.toString(),
        style: const TextStyle(fontSize: 14),
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => userData.length;

  @override
  int get selectedRowCount => 0;
}

class NullUserDataTable extends DataTableSource {
  final _data = List.generate(
      10,
      (index) => UserModel(
          id: 'asd454asdasd',
          username: 'username',
          email: 'email',
          password: 'password',
          phone: 'phone',
          birthDate: DateTime(2000, 10, 6),
          gender: 'gender',
          isAdmin: false,
          // createdAt: DateTime(2024, 10, 6),
          // updatedAt: DateTime(2024, 10, 6),
          // v: 0,
          ));

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(SkeletonizerText(text: _data[index].username)),
      DataCell(SkeletonizerText(text: _data[index].email)),
      DataCell(SkeletonizerText(text: _data[index].password)),
      DataCell(SkeletonizerText(text: _data[index].phone)),
      DataCell(SkeletonizerText(text: _data[index].birthDate.toString())),
      DataCell(SkeletonizerText(text: _data[index].gender)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
