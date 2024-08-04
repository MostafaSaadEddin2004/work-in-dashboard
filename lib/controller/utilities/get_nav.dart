// import 'package:beamer/beamer.dart';
// import 'package:flutter/material.dart';
// import 'package:work_in_dashboard/controller/constants/nav_items.dart';

// class GetNav {
//   static void getNav(int selectedIndex, BuildContext context) {
//     final path = (context.currentBeamLocation.state as BeamState).uri.path;
//     if (path.contains(BeamerNavItem.users)) {
//       selectedIndex = 0;
//     } else if (path.contains(BeamerNavItem.companies)) {
//       selectedIndex = 1;
//     } else if (path.contains(BeamerNavItem.jobs)) {
//       selectedIndex = 2;
//     } else if (path.contains(BeamerNavItem.training)) {
//       selectedIndex = 3;
//     } else {
//       selectedIndex = -1;
//     }
//   }

//   static String getTitle(BuildContext context) {
//     final path = (context.currentBeamLocation.state as BeamState).uri.path;
//     if (path.contains(BeamerNavItem.users)) {
//       return 'Users';
//     } else if (path.contains(BeamerNavItem.companies)) {
//       return 'Companies';
//     } else if (path.contains(BeamerNavItem.jobs)) {
//       return 'Jobs';
//     } else if (path.contains(BeamerNavItem.training)) {
//       return 'Training';
//     } else {
//       return 'Dashboard';
//     }
//   }
// }
