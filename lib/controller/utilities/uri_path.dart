import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_in_dashboard/controller/constants/nav_items.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/view/components/add_button.dart';

abstract class UriPath {
  static int getNav(BuildContext context, String path) {
    if (path.contains(NavItemsName.users)) {
      return 0;
    } else if (path.contains(NavItemsName.companies)) {
      return 1;
    } else if (path.contains(NavItemsName.jobs)) {
      return 2;
    } else if (path.contains(NavItemsName.training)) {
      return 3;
    } else {
      return -1;
    }
  }

  static String getTitle(BuildContext context, String path) {
    if (path.contains(NavItemsName.users)) {
      return 'Users';
    } else if (path.contains(NavItemsName.companies)) {
      return 'Companies';
    } else if (path.contains(NavItemsName.jobs)) {
      return 'Jobs';
    } else if (path.contains(NavItemsName.training)) {
      return 'Training';
    } else {
      return 'Dashboard';
    }
  }

  static Widget getButtonTitle(BuildContext context, String path) {
    if (path.contains(NavItemsName.jobsName)) {
      return AddButton(
        text: 'Create new',
        color: AppColor.blue,
        onPressed: () {
          context.goNamed(NavItemsName.addJobName);
        },
      );
    } else if (path.contains(NavItemsName.trainingName)) {
      return AddButton(
        text: 'Create new',
        color: AppColor.blue,
        onPressed: () {
          context.goNamed(NavItemsName.addTrainingName);
        },
      );
    } else {
      return const PreferredSize(preferredSize: Size.zero, child: SizedBox());
    }
  }
}
