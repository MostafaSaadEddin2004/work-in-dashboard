import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_in_dashboard/view/screens/companies_screen.dart';
import 'package:work_in_dashboard/view/screens/job_opportunities_screen.dart';
import 'package:work_in_dashboard/view/screens/training_opportunities_screen.dart';
import 'package:work_in_dashboard/view/screens/users_screend.dart';

class SideNavigationBarController extends GetxController {
  List<Widget> screens = const [
    UsersScreen(),
    CompaniesScreen(),
    JobOpportunitiesScreen(),
    TrainingOpportunities(),
  ];

  final currentIndex = 0.obs;

  Widget get currentScreen => screens[currentIndex.value];

  void changeScreen(int index) {
    currentIndex.value = index;
  }
}
