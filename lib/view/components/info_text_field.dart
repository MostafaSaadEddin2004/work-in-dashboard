import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';

class InfoTextField extends StatelessWidget {
  const InfoTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.enabled,
    this.suffixIcon,
    this.onTap,
  });
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool enabled;
  final Widget? suffixIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            enableSuggestions: true,
            maxLines: 1,
            enabled: enabled,
            onTap: onTap,
            controller: controller,
            cursorColor: AppColor.white.withOpacity(0.5),
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16)),
              filled: true,
              fillColor: Theme.of(context).colorScheme.primary,
              hintText: hintText,
              suffixIcon: suffixIcon,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          )
        ],
      ),
    );
  }
}
