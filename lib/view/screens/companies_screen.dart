import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/model/user_data_table.dart';
import 'package:work_in_dashboard/view/components/search_text_field.dart';

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({super.key});

  @override
  State<CompaniesScreen> createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  bool ascending = false;
  List data = [];
  onSortColumn(columnIndex, ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        // data.sort((a, b) => a.name.compareTo(b.name),);
      } else {
        // data.sort((a, b) => b.name.compareTo(a.name),);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Column(
                children: [
                  Text(
                    'Dashboard',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            PaginatedDataTable(
              rowsPerPage: 5,
              columnSpacing: 28.2.w,
              showFirstLastButtons: true,
              sortAscending: ascending,
              sortColumnIndex: 0,
              header: Row(
                children: [
                  Text(
                    'Companies',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  SearchTextField(
                    hintText: 'Search a company',
                    onChanged: (value) {
                      setState(() {
                        // myData = filterData.where((element)=> element.name.contains(value)).toList();
                      });
                    },
                  ),
                ],
              ),
              columns: [
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Full name',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      ascending = !ascending;
                    });
                    onSortColumn(columnIndex, ascending);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'User Experience',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      ascending = !ascending;
                    });
                    onSortColumn(columnIndex, ascending);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Email',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      ascending = !ascending;
                    });
                    onSortColumn(columnIndex, ascending);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Phone',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      ascending = !ascending;
                    });
                    onSortColumn(columnIndex, ascending);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Age',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      ascending = !ascending;
                    });
                    onSortColumn(columnIndex, ascending);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Current address',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      ascending = !ascending;
                      onSortColumn(columnIndex, ascending);
                    });
                  },
                ),
              ],
              source: UserDataTable(),
            ),
          ],
        ),
      ),
    );
  }
}
