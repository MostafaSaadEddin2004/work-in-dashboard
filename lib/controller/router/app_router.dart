import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_in_dashboard/controller/constants/nav_items.dart';
import 'package:work_in_dashboard/view/screens/companies_screen.dart';
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
            builder: (context, state, navigationShell) => LandingScreen(
                  navShell: navigationShell,
                ),
            branches: [
              StatefulShellBranch(navigatorKey: _navDashboard, routes: [
                GoRoute(
                  name: NavItemsName.dashBoardName,
                  path: '/',
                  builder: (context, state) => DashBoardScreen(
                    key: state.pageKey,
                  ),
                ),
              ]),
              StatefulShellBranch(navigatorKey: _navUser, routes: [
                GoRoute(
                  name: NavItemsName.usersName,
                  path: '/Users',
                  builder: (context, state) => UsersScreen(
                    key: state.pageKey,
                  ),
                ),
              ]),
              StatefulShellBranch(navigatorKey: _navCompany, routes: [
                GoRoute(
                  name: NavItemsName.companies,
                  path: '/Companies',
                  builder: (context, state) => CompaniesScreen(
                    key: state.pageKey,
                  ),
                ),
              ]),
              StatefulShellBranch(navigatorKey: _navJob, routes: [
                GoRoute(
                    name: NavItemsName.jobs,
                    path: '/Jobs',
                    builder: (context, state) => JobsScreen(
                          key: state.pageKey,
                        ),
                    routes: [
                      GoRoute(
                        name: NavItemsName.addJobName,
                        path: 'AddJob',
                        builder: (context, state) => AddJobScreen(
                          key: state.pageKey,
                        ),
                      ),
                      GoRoute(
                        name: NavItemsName.updateJobName,
                        path:
                            'UpdateJob/:jobId/:companyName/:email/:phone/:jobTitle/:experiencesForJob/:workTime/:location/:gender',
                        builder: (context, state) => UpdateJobScreen(
                          key: state.pageKey,
                          jobId: state.pathParameters['jobId']!,
                          companyName: state.pathParameters['companyName']!,
                          companyEmail: state.pathParameters['email']!,
                          companyPhone: state.pathParameters['phone']!,
                          jobTitle: state.pathParameters['jobTitle']!,
                          experiencesForJob:
                              state.pathParameters['experiencesForJob']!,
                          workTime: state.pathParameters['workTime']!,
                          location: state.pathParameters['location']!,
                          gender: state.pathParameters['gender']!,
                        ),
                      ),
                    ]),
              ]),
              StatefulShellBranch(navigatorKey: _navTraining, routes: [
                GoRoute(
                    name: NavItemsName.trainingName,
                    path: '/Training',
                    builder: (context, state) => TrainingScreen(
                          key: state.pageKey,
                        ),
                    routes: [
                      GoRoute(
                        name: NavItemsName.addTrainingName,
                        path: 'AddTraining',
                        builder: (context, state) => AddTrainingScreen(
                          key: state.pageKey,
                        ),
                      ),
                      GoRoute(
                        name: NavItemsName.updateTrainingName,
                        path:
                            'UpdateTraining/:trainingId/:trainingCompany/:email/:phone/:kindOfTrain/:location',
                        builder: (context, state) => UpdateTrainingScreen(
                          key: state.pageKey,
                          trainingId: state.pathParameters['trainingId']!,
                          trainingCompany:
                              state.pathParameters['trainingCompany']!,
                          companyEmail: state.pathParameters['email']!,
                          companyPhone: state.pathParameters['phone']!,
                          kindOfTrain: state.pathParameters['kindOfTrain']!,
                          location: state.pathParameters['location']!,
                        ),
                      ),
                    ]),
              ]),
            ])
      ]);
}
