import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.onChanged,
    required this.hintText,
  });
  final void Function(String? value) onChanged;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270.w,
      child: TextFormField(
        cursorColor: AppColor.white.withOpacity(0.5),
        style: Theme.of(context).textTheme.bodySmall,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16)),
          filled: true,
          fillColor: Theme.of(context).colorScheme.primary,
          hintText: hintText,
          suffixIcon: const Icon(Icons.search_rounded),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
