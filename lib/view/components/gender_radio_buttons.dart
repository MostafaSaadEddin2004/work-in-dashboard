import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';

class GenderRadioButton extends StatefulWidget {
  const GenderRadioButton(
      {super.key, this.selectedRadio = 1, required this.onChanged});
  final int selectedRadio;
  final void Function(int? value) onChanged;
  @override
  State<GenderRadioButton> createState() => _GenderRadioButtonState();
}

class _GenderRadioButtonState extends State<GenderRadioButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gender',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120.w,
                child: RadioListTile(
                  contentPadding: const EdgeInsets.all(0),
                  activeColor: AppColor.blue,
                  title: const Text(
                    'Male',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  value: 1,
                  groupValue: widget.selectedRadio,
                  onChanged: widget.onChanged,
                ),
              ),
              SizedBox(
                width: 120.w,
                child: RadioListTile(
                  contentPadding: const EdgeInsets.all(0),
                  activeColor: AppColor.blue,
                  title: const Text(
                    'Female',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  value: 2,
                  groupValue: widget.selectedRadio,
                  onChanged: widget.onChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
