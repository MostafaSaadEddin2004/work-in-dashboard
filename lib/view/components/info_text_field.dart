import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';

class InfoTextField extends StatelessWidget {
  const InfoTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.suffixIcon,
    this.onTap,
    this.validator,
  });
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isDesktop(context)? 450:240,
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enableSuggestions: true,
            maxLines: 1,
            onTap: onTap,
            validator: validator,
            controller: controller,
            cursorColor: AppColor.white.withOpacity(0.5),
            style: const TextStyle(fontSize: 12, color: AppColor.white),
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
