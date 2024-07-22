import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';

class Snack {
  static showSnack(BuildContext context, String title, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      backgroundColor: AppColor.secondary,
      margin: Responsive.isDesktop(context)
          ? const EdgeInsets.symmetric(horizontal: 200, vertical: 32)
          : const EdgeInsets.all(0),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      duration: const Duration(seconds: 3),
    ));
  }
}
