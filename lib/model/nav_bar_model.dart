import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/constants/nav_items.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';

class NavBarModel {
  final String title;
  final Icon icon;
  bool isHovered;
  final Color activeColor;
  final Color unactiveColor;
  final String nav;
  final int index;

  NavBarModel({
    required this.title,
    required this.icon,
    required this.isHovered,
    required this.activeColor,
    required this.unactiveColor,
    required this.nav,
    required this.index,
  });
  static final List<NavBarModel> navData = [
    NavBarModel(
      title: 'Dashboard',
      icon: const Icon(
        Icons.space_dashboard_rounded,
        color: AppColor.white,
        size: 25,
      ),
      isHovered: false,
      activeColor: AppColor.blue,
      unactiveColor: AppColor.primary,
      nav: BeamerNavItem.dashBoard,
      index: 0,
    ),
    NavBarModel(
      title: 'Users',
      icon: const Icon(
        Icons.person,
        color: AppColor.white,
        size: 25,
      ),
      isHovered: false,
      activeColor: AppColor.blue,
      unactiveColor: AppColor.primary,
      nav: BeamerNavItem.users,
      index: 1,
    ),
    NavBarModel(
      title: 'Companies',
      icon: const Icon(
        Icons.business_rounded,
        color: AppColor.white,
        size: 25,
      ),
      isHovered: false,
      activeColor: AppColor.blue,
      unactiveColor: AppColor.primary,
      nav: BeamerNavItem.companies,
      index: 2,
    ),
    NavBarModel(
      title: 'Jobs',
      icon: const Icon(
        Icons.business_center_rounded,
        color: AppColor.white,
        size: 25,
      ),
      isHovered: false,
      activeColor: AppColor.blue,
      unactiveColor: AppColor.primary,
      nav: BeamerNavItem.jobs,
      index: 3,
    ),
    NavBarModel(
      title: 'Training',
      icon: const Icon(
        Icons.accessibility_new_sharp,
        color: AppColor.white,
        size: 25,
      ),
      isHovered: false,
      activeColor: AppColor.blue,
      unactiveColor: AppColor.primary,
      nav: BeamerNavItem.training,
      index: 4,
    ),
  ];
}
