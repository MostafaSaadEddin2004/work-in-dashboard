import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_in_dashboard/controller/constants/nav_items.dart';

abstract class UriPath {
  static void getNav(int selectedIndex, BuildContext context) {
    final path = GoRouterState.of(context).path!;
    if (path.contains(NavItemsName.route)) {
      selectedIndex = -1;
    }
    else if (path.contains(NavItemsName.users)) {
      selectedIndex = 0;
    }
     else if (path.contains(NavItemsName.companies)) {
      selectedIndex = 1;
    } else if (path.contains(NavItemsName.jobs)) {
      selectedIndex = 2;
    } else if (path.contains(NavItemsName.training)) {
      selectedIndex = 3;
    } else {
      selectedIndex = -1;
    }
  }

  static String getTitle(BuildContext context) {
    final path = GoRouterState.of(context).path!;
    if (path.contains(NavItemsName.route)) {
      return 'Dashboard';
    } else if (path.contains(NavItemsName.users)) {
      return 'Users';
    } else if (path.contains(NavItemsName.companies)) {
      return 'Companies';
    } else if (path.contains(NavItemsName.jobs)) {
      return 'Jobs';
    } else if (path.contains(NavItemsName.training)) {
      return 'Training';
    } else {
      return '';
    }
  }
}
