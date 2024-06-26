import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width <= 979;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 979;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeiht(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
