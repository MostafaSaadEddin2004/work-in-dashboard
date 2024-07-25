import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_in_dashboard/controller/constants/nav_items.dart';
import 'package:work_in_dashboard/view/screens/company/companies_requests_screen.dart';
import 'package:work_in_dashboard/view/screens/company/companies_screen.dart';
import 'package:work_in_dashboard/view/screens/dashboard_screen.dart';
import 'package:work_in_dashboard/view/screens/job/add_job_screen.dart';
import 'package:work_in_dashboard/view/screens/job/jobs_screen.dart';
import 'package:work_in_dashboard/view/screens/job/update_job_screen.dart';
import 'package:work_in_dashboard/view/screens/training/add_training_screen.dart';
import 'package:work_in_dashboard/view/screens/training/training_screen.dart';
import 'package:work_in_dashboard/view/screens/training/update_training_screen.dart';
import 'package:work_in_dashboard/view/screens/users_screen.dart';

abstract class BeamerRouterDeleget {
  static BeamerDelegate appRouter() {
    return BeamerDelegate(
        setBrowserTabTitle: true,
        locationBuilder: RoutesLocationBuilder(
          routes: {
            BeamerNavItem.route: (context, state, data) => BeamPage(
                key: ValueKey(BeamerNavItem.routeKey),
                type: BeamPageType.slideTopTransition,
                child: const DashBoardScreen()),
            BeamerNavItem.dashBoard: (context, state, data) => BeamPage(
                key: ValueKey(BeamerNavItem.dashBoardKey),
                type: BeamPageType.slideTopTransition,
                child: const DashBoardScreen()),
            BeamerNavItem.users: (context, state, data) => BeamPage(
                key: ValueKey(BeamerNavItem.usersKey),
                type: BeamPageType.slideTopTransition,
                child: const UsersScreen()),
            BeamerNavItem.companies: (context, state, data) {
              if(state.pathPatternSegments.contains('CompaniesRequests')){
                return BeamPage(
                key: ValueKey(BeamerNavItem.companiesRequestKey),
                type: BeamPageType.slideTopTransition,
                child: const CompaniesRequestsSecreen());
              }
              return BeamPage(
                key: ValueKey(BeamerNavItem.companiesKey),
                type: BeamPageType.slideTopTransition,
                child: const CompaniesScreen());
            },
            BeamerNavItem.jobs: (context, state, data) {
              if (state.pathPatternSegments.contains('AddJob')) {
                return BeamPage(
                    key: ValueKey(BeamerNavItem.addJobKey),
                    type: BeamPageType.slideLeftTransition,
                    child: const AddJobScreen());
              } else if (state.pathPatternSegments.contains('UpdateJob')) {
                return BeamPage(
                    key: ValueKey(BeamerNavItem.updateJobKey),
                    type: BeamPageType.slideLeftTransition,
                    child: const UpdateJobScreen());
              }
              return BeamPage(
                  key: ValueKey(BeamerNavItem.jobsKey),
                  type: BeamPageType.slideTopTransition,
                  child: const JobsScreen());
            },
            BeamerNavItem.training: (context, state, data) {
              if (state.pathPatternSegments.contains('AddTraining')) {
                return BeamPage(
                    key: ValueKey(BeamerNavItem.addTrainingKey),
                    type: BeamPageType.slideLeftTransition,
                    child: const AddTrainingScreen());
              }
              else if (state.pathPatternSegments.contains('UpdateTraining')) {
                return BeamPage(
                    key: ValueKey(BeamerNavItem.updateTrainingKey),
                    type: BeamPageType.slideLeftTransition,
                    child: const UpdateTrainingScreen());
              }
              return BeamPage(
                  key: ValueKey(BeamerNavItem.trainingKey),
                  type: BeamPageType.slideTopTransition,
                  child: const TrainingScreen());
            }
          },
        ).call);
  }
}
