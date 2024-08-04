import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';

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
      width: Responsive.isDesktop(context) ? 450 : 240,
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
                width: Responsive.isDesktop(context) ? 225 : 120,
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
                width: Responsive.isDesktop(context) ? 225 : 120,
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
