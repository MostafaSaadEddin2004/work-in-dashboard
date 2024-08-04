import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:work_in_dashboard/controller/bloc/companies_requests_services/companies_requests_services_cubit.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/model/company_request_data_tabel.dart';
import 'package:work_in_dashboard/model/company_request_model.dart';
import 'package:work_in_dashboard/view/components/search_text_field.dart';

class CompaniesRequestsSecreen extends StatefulWidget {
  const CompaniesRequestsSecreen({super.key});

  @override
  State<CompaniesRequestsSecreen> createState() =>
      _CompaniesRequestsSecreenState();
}

class _CompaniesRequestsSecreenState extends State<CompaniesRequestsSecreen> {
  bool addMode = false;
  bool ascending = false;
  onSortColumn(
      int columnIndex, bool ascending, List<CompanyRequestModel> data) {
    if (columnIndex == 0) {
      if (ascending) {
        data.sort(
          (a, b) => a.id.compareTo(b.id),
        );
      } else {
        data.sort(
          (a, b) => b.id.compareTo(a.id),
        );
      }
    }
  }

  bool isLoading = false;

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
            BlocBuilder<CompaniesRequestsServicesCubit,
                CompaniesRequestsServicesState>(
              bloc: CompaniesRequestsServicesCubit()..getAllCompaniesRequests(),
              builder: (context, state) {
                if (state is CompaniesRequestsServicesFailure) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                } else if (state is CompaniesRequestsServicesFetched) {
                  var data = state.companyRequestData;
                  return PaginatedDataTable(
                    rowsPerPage: data.length < 5 ? data.length : 5,
                    columnSpacing: Responsive.isDesktop(context) ? 234 : 20,
                    horizontalMargin: 16,
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
                        label: Skeletonizer(
                          child: Text(
                            'Id',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
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
                          'Actions',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                    source: CompanyRequestDataTabel(
                        companiesRequestsData: data,
                        isLoading: isLoading,
                        context: context),
                  );
                }
                return PaginatedDataTable(
                  rowsPerPage: 5,
                  columnSpacing: Responsive.isDesktop(context) ? 234 : 20,
                  horizontalMargin: 16,
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
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          ascending = !ascending;
                        });
                      },
                    ),
                    DataColumn(
                      label: Text(
                        'Actions',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                  source: NullCompanyRequestDataTabel(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
