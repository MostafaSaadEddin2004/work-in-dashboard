import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;
  const Responsive({super.key, this.desktop, this.tablet, this.mobile});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width <= 979;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 979;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width <= 768 && mobile != null) {
      return mobile!;
    } else if (_size.width >= 768 && tablet != null) {
      return tablet!;
    } else {
      return desktop!;
    }
  }
}
