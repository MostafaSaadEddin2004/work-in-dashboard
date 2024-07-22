import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_in_dashboard/controller/constants/nav_items.dart';
import 'package:work_in_dashboard/view/screens/companies_screen.dart';
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
        initialPath: '/',
        setBrowserTabTitle: true,
        
        locationBuilder: RoutesLocationBuilder(
          routes: {
            BeamerNavItem.route: (context, state, data) => BeamPage(
                key: ValueKey(BeamerNavItem.routeKey),
                type: BeamPageType.fadeTransition,
                child: const DashBoardScreen()),
            BeamerNavItem.dashBoard: (context, state, data) => BeamPage(
                key: ValueKey(BeamerNavItem.dashBoardKey),
                type: BeamPageType.fadeTransition,
                child: const DashBoardScreen()),
            BeamerNavItem.users: (context, state, data) => BeamPage(
                key: ValueKey(BeamerNavItem.usersKey),
                type: BeamPageType.fadeTransition,
                child: const UsersScreen()),
            BeamerNavItem.companies: (context, state, data) => BeamPage(
                key: ValueKey(BeamerNavItem.companiesKey),
                type: BeamPageType.fadeTransition,
                child: const CompaniesScreen()),
            BeamerNavItem.jobs: (context, state, data) {
              if (state.pathPatternSegments.contains('Add')) {
                return BeamPage(
                    key: ValueKey(BeamerNavItem.addJobKey),
                    type: BeamPageType.fadeTransition,
                    child: const AddJobScreen());
              } else if (state.pathPatternSegments.contains('Update')) {
                return BeamPage(
                    key: ValueKey(BeamerNavItem.updateJobKey),
                    type: BeamPageType.fadeTransition,
                    child: const UpdateJobScreen());
              }
              return BeamPage(
                  key: ValueKey(BeamerNavItem.jobsKey),
                  type: BeamPageType.fadeTransition,
                  child: const JobsScreen());
            },
            BeamerNavItem.training: (context, state, data) {
              if (state.pathPatternSegments.contains('Add')) {
                return BeamPage(
                    key: ValueKey(BeamerNavItem.addTrainingKey),
                    type: BeamPageType.fadeTransition,
                    child: const AddTrainingScreen());
              } else if (state.pathPatternSegments.contains('Update')) {
                return BeamPage(
                    key: ValueKey(BeamerNavItem.updateTrainingKey),
                    type: BeamPageType.fadeTransition,
                    child: const UpdateTrainingScreen());
              }
              return BeamPage(
                  key: ValueKey(BeamerNavItem.trainingKey),
                  type: BeamPageType.fadeTransition,
                  child: const TrainingScreen());
            }
          },
        ).call);
  }
}
