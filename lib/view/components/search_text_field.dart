import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.onChanged,
    required this.hintText,
    required this.wantAdd,
    this.onAddPressed,
    required this.enabled,
  });
  final void Function(String? value)? onChanged;
  final String hintText;
  final bool wantAdd;
  final void Function()? onAddPressed;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: AppColor.white.withOpacity(0.5),
        style: TextStyle(fontSize: 12.sp),
        decoration: InputDecoration(
          enabled: enabled,
          errorStyle: const TextStyle(fontSize: 12),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          filled: true,
          fillColor: Theme.of(context).colorScheme.primary,
          hintText: hintText,
          suffixIcon: wantAdd == true
              ? IconButton(
                  onPressed: onAddPressed,
                  icon: const Icon(Icons.add_circle_rounded))
              : const Icon(Icons.search_rounded),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
