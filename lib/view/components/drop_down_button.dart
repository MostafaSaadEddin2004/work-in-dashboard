import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key, required this.onChanged});
  final void Function(int? value) onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: const [
        DropdownMenuItem(
          value: 2024,
          enabled: true,
          child: Text('2024'),
        ),
        DropdownMenuItem(
          value: 2025,
          enabled: false,
          child: Text('2025'),
        ),
        DropdownMenuItem(
          value: 2026,
          enabled: false,
          child: Text('2026'),
        ),
        DropdownMenuItem(
          value: 2027,
          enabled: false,
          child: Text('2027'),
        ),
      ],
      onChanged: onChanged,
      hint: const Text('Chose a year'),
      icon: const Icon(Icons.calendar_month_outlined),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColor.white, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColor.white, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColor.white, width: 2)),
      ),
      dropdownColor: AppColor.secondary,
      style: const TextStyle(color: AppColor.white),
      isDense: true,
    );
  }
}
