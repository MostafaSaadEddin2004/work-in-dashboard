import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';

class SkeletonizerText extends StatelessWidget {
  const SkeletonizerText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        containersColor: AppColor.white,
        child: Text(
          text,
          style: const TextStyle(fontSize: 14),
        ));
  }
}
