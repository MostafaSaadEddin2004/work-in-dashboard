import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_in_dashboard/controller/constants/nav_items.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/view/screens/company/companies_requests_screen.dart';
import 'package:work_in_dashboard/view/screens/company/companies_screen.dart';
import 'package:work_in_dashboard/view/screens/dashboard_screen.dart';
import 'package:work_in_dashboard/view/screens/job/add_job_screen.dart';
import 'package:work_in_dashboard/view/screens/job/jobs_screen.dart';
import 'package:work_in_dashboard/view/screens/job/update_job_screen.dart';
import 'package:work_in_dashboard/view/screens/landing_screen.dart';
import 'package:work_in_dashboard/view/screens/training/add_training_screen.dart';
import 'package:work_in_dashboard/view/screens/training/training_screen.dart';
import 'package:work_in_dashboard/view/screens/training/update_training_screen.dart';
import 'package:work_in_dashboard/view/screens/users_screen.dart';

abstract class AppRoute {
  static final _navKey = GlobalKey<NavigatorState>();
  static final _navDashboard = GlobalKey<NavigatorState>();
  static final _navUser = GlobalKey<NavigatorState>();
  static final _navCompany = GlobalKey<NavigatorState>();
  static final _navJob = GlobalKey<NavigatorState>();
  static final _navTraining = GlobalKey<NavigatorState>();

  static final GoRouter appGoRouter = GoRouter(
      initialLocation: '/',
      navigatorKey: _navKey,
      debugLogDiagnostics: true,
      routes: [
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) => Material(
                  child: LandingScreen(
                    navShell: navigationShell,
                  ),
                ),
            branches: [
              StatefulShellBranch(navigatorKey: _navDashboard, routes: [
                GoRoute(
                  name: NavItemsName.dashBoardName,
                  path: '/',
                  builder: (context, state) => Material(
                      color: AppColor.primary,
                      child: DashBoardScreen(
                        key: state.pageKey,
                      )),
                ),
              ]),
              StatefulShellBranch(navigatorKey: _navUser, routes: [
                GoRoute(
                  name: NavItemsName.usersName,
                  path: '/Users',
                  builder: (context, state) => Material(
                      color: AppColor.primary,
                      child: UsersScreen(
                        key: state.pageKey,
                      )),
                ),
              ]),
              StatefulShellBranch(navigatorKey: _navCompany, routes: [
                GoRoute(
                    name: NavItemsName.companies,
                    path: '/Companies',
                    builder: (context, state) => Material(
                        color: AppColor.primary,
                        child: CompaniesScreen(
                          key: state.pageKey,
                        )),
                    routes: [
                      GoRoute(
                        name: NavItemsName.companiesRequestName,
                        path: 'CompaniesRequest',
                        builder: (context, state) => Material(
                            color: AppColor.primary,
                            child: CompaniesRequestsSecreen(
                              key: state.pageKey,
                            )),
                      ),
                    ]),
              ]),
              StatefulShellBranch(navigatorKey: _navJob, routes: [
                GoRoute(
                    name: NavItemsName.jobs,
                    path: '/Jobs',
                    builder: (context, state) => Material(
                        color: AppColor.primary,
                        child: JobsScreen(
                          key: state.pageKey,
                        )),
                    routes: [
                      GoRoute(
                        name: NavItemsName.addJobName,
                        path: 'AddJob',
                        builder: (context, state) => Material(
                          color: AppColor.primary,
                          child: AddJobScreen(
                            key: state.pageKey,
                          ),
                        ),
                      ),
                      GoRoute(
                        name: NavItemsName.updateJobName,
                        path:
                            'UpdateJob/:jobId/:companyName/:jobTitle/:experiencesForJob/:workTime/:location/:gender',
                        builder: (context, state) => Material(
                            color: AppColor.primary,
                            child: UpdateJobScreen(
                              key: state.pageKey,
                              jobId: state.pathParameters['jobId']!,
                              companyName: state.pathParameters['companyName']!,
                              jobTitle: state.pathParameters['jobTitle']!,
                              experiencesForJob:
                                  state.pathParameters['experiencesForJob']!,
                              workTime: state.pathParameters['workTime']!,
                              location: state.pathParameters['location']!,
                              gender: state.pathParameters['gender']!,
                            )),
                      ),
                    ]),
              ]),
              StatefulShellBranch(navigatorKey: _navTraining, routes: [
                GoRoute(
                    name: NavItemsName.trainingName,
                    path: '/Training',
                    builder: (context, state) => Material(
                        color: AppColor.primary,
                        child: TrainingScreen(
                          key: state.pageKey,
                        )),
                    routes: [
                      GoRoute(
                        name: NavItemsName.addTrainingName,
                        path: 'AddTraining',
                        builder: (context, state) => Material(
                            color: AppColor.primary,
                            child: AddTrainingScreen(
                              key: state.pageKey,
                            )),
                      ),
                      GoRoute(
                        name: NavItemsName.updateTrainingName,
                        path:
                            'UpdateTraining/:trainingId/:trainingCompany/:kindOfTrain/:location',
                        builder: (context, state) => Material(
                            color: AppColor.primary,
                            child: UpdateTrainingScreen(
                              key: state.pageKey,
                              trainingId: state.pathParameters['trainingId']!,
                              trainingCompany:
                                  state.pathParameters['trainingCompany']!,
                              kindOfTrain: state.pathParameters['kindOfTrain']!,
                              location: state.pathParameters['location']!,
                            )),
                      ),
                    ]),
              ]),
            ])
      ]);
}
