import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:work_in_dashboard/controller/api/services/company_services.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/model/company_data_table.dart';
import 'package:work_in_dashboard/model/company_mode.dart';
import 'package:work_in_dashboard/view/components/search_text_field.dart';

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({super.key});

  @override
  State<CompaniesScreen> createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  bool addMode = false;
  bool ascending = false;
  onSortColumn(int columnIndex, bool ascending, List<CompanyModel> data) {
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
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Column(
                children: [
                  Text(
                    'Companies',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            FutureBuilder(
              future: CompanyServices.getAllCompanies(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return PaginatedDataTable(
                    rowsPerPage: 5,
                    columnSpacing: 28.w,
                    sortAscending: ascending,
                    sortColumnIndex: 0,
                    header: const Row(
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        SearchTextField(
                          enabled: false,
                          hintText: 'Search a company',
                        ),
                      ],
                    ),
                    columns: [
                      DataColumn(
                        label: Skeletonizer(
                          child: Text(
                            'Id',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                    source: NullCompanyDataTable(),
                  );
                } else if (snapshot.hasData) {
                  var data = snapshot.data!;
                  return PaginatedDataTable(
                    rowsPerPage: data.length < 5 ? data.length : 5,
                    columnSpacing: 28.w,
                    sortAscending: ascending,
                    sortColumnIndex: 0,
                    header: Row(
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        SearchTextField(
                          enabled: true,
                          hintText: 'Search a company',
                          onChanged: (value) {
                            setState(() {
                              data = value == null
                                  ? data
                                  : data
                                      .where((element) =>
                                          element.id.toString().contains(value))
                                      .toList();
                            });
                          },
                        ),
                      ],
                    ),
                    columns: [
                      DataColumn(
                        label: Text(
                          'Id',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        onSort: (columnIndex, ascending) {
                          setState(() {
                            ascending = !ascending;
                          });
                          onSortColumn(columnIndex, ascending, data);
                        },
                      ),
                    ],
                    source: CompanyDataTable(companyData: data),
                  );
                }
                return const Center(
                  child: Text('There is no data'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
