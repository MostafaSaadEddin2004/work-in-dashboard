import 'package:flutter/material.dart';

class NavBarModel {
  final String title;
  final Icon icon;
  bool isHovered;
  final Color activeColor;
  final Color unactiveColor;

  NavBarModel({
    required this.title,
    required this.icon,
    required this.isHovered,
    required this.activeColor,
    required this.unactiveColor,
  });
}
