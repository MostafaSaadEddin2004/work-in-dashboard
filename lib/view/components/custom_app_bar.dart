import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.onChanged,
      required this.controller,
      required this.hintText});
  final Function(String? value) onChanged;
  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Dashboard',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const Spacer(),
        SizedBox(
          width: 240.w,
          child: TextFormField(
            controller: controller,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16)),
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondary,
              hintText: hintText,
              suffixIcon: const Icon(Icons.search),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
