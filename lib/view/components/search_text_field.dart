import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.onChanged,
    required this.hintText,
    required this.enabled,
  });
  final void Function(String? value)? onChanged;
  final String hintText;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: AppColor.white.withOpacity(0.5),
        style: TextStyle(fontSize: !Responsive.isDesktop(context) ? 12 : 16),
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
          suffixIcon:  const Icon(Icons.search_rounded),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
