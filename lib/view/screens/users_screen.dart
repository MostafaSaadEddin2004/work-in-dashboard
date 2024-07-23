import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_in_dashboard/controller/bloc/user_service/user_service_cubit.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/model/user_data_table.dart';
import 'package:work_in_dashboard/model/user_model.dart';
import 'package:work_in_dashboard/view/components/search_text_field.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen>
    with SingleTickerProviderStateMixin {
  bool ascending = false;
  onSortColumn(int columnIndex, bool ascending, List<UserModel> data) {
    if (columnIndex == 0) {
      if (ascending) {
        data.sort(
          (a, b) => a.username.compareTo(b.username),
        );
      } else {
        data.sort(
          (a, b) => b.username.compareTo(a.username),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserServiceCubit(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Column(
                  children: [
                    Text(
                      'Users',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ),
              BlocBuilder<UserServiceCubit, UserServiceState>(
                bloc: UserServiceCubit()..getAllUsers(),
                builder: (context, state) {
                  if (state is UserServiceFailure) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else if (state is UserServiceFetched) {
                    var data = state.userData;
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
                            hintText: 'Search a user',
                            onChanged: (value) {
                              setState(() {
                                data = value == null
                                    ? data
                                    : data
                                        .where((element) => element.username
                                            .contains(value))
                                        .toList();
                              });
                            },
                          ),
                        ],
                      ),
                      columns: [
                        DataColumn(
                          label: Text(
                            'User Name',
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
                          label: Skeletonizer(
                            child: Text(
                              'Email',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
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
                            'Birth Date',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Gender',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Is Admin',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                      source: UserDataTable(userData: data),
                    );
                  }
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
                          hintText: 'Search a user',
                        ),
                      ],
                    ),
                    columns: [
                      DataColumn(
                        label: Skeletonizer(
                          child: Text(
                            'User Name',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Skeletonizer(
                          child: Text(
                            'Email',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Skeletonizer(
                          child: Text(
                            'Phone',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Skeletonizer(
                          child: Text(
                            'Birth Date',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Skeletonizer(
                          child: Text(
                            'Gender',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Skeletonizer(
                          child: Text(
                            'Is Admin',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                    source: NullUserDataTable(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
