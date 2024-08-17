import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_in_dashboard/controller/bloc/company_service/company_services_cubit.dart';
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
  bool isAscending = false;
  onSortColumn(int columnIndex, bool ascending, List<CompanyModel> data) {
    if (columnIndex == 0) {
      if (ascending) {
        data.sort(
          (a, b) => a.createdAt.compareTo(b.createdAt),
        );
      } else {
        data.sort(
          (a, b) => b.createdAt.compareTo(a.createdAt),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: BlocBuilder<CompanyServicesCubit, CompanyServicesState>(
          bloc: CompanyServicesCubit()..getAllCompanies(),
          builder: (context, state) {
            if (state is CompanyServicesFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state is CompanyServicesFetched) {
              var data = state.companyData;
              return PaginatedDataTable(
                rowsPerPage: data.length < 5 ? data.length : 8,
                columnSpacing: 50,
                horizontalMargin: 16,
                sortAscending: isAscending,
                sortColumnIndex: 0,
                header: Row(
                  children: [
                    Text(
                      'Companies',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
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
                                      element.companyName.contains(value))
                                  .toList();
                        });
                      },
                    ),
                  ],
                ),
                columns: [
                  DataColumn(
                    label: Text(
                      'Name',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    onSort: (columnIndex, ascending) {
                      setState(() {
                        onSortColumn(columnIndex, ascending, data);
                        isAscending = ascending;
                      });
                    },
                  ),
                  DataColumn(
                    label: Text(
                      'Email',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Phone',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Company field',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Acceptance',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Actions',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
                source: CompanyDataTable(companyData: data, context: context),
              );
            }
            return PaginatedDataTable(
              rowsPerPage: 5,
              columnSpacing: 50,
              horizontalMargin: 16,
              sortAscending: isAscending,
              sortColumnIndex: 0,
              header: Row(
                children: [
                  Text(
                    'Companies',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const SearchTextField(
                    enabled: false,
                    hintText: 'Search a company',
                  ),
                ],
              ),
              columns: [
                DataColumn(
                  label: Text(
                    'Name',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      ascending = !ascending;
                    });
                  },
                ),
                DataColumn(
                  label: Text(
                    'Email',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Phone',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Company field',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Acceptance',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Actions',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
              source: NullCompanyDataTable(),
            );
          },
        ),
      ),
    );
  }
}
