import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';

class Snack {
  static showSnack(BuildContext context, String title, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      backgroundColor: AppColor.secondary,
      duration: const Duration(seconds: 3),
    ));
  }
}
