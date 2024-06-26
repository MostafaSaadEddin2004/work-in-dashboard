import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          isHovered=value;
        });
      },
      onTap: widget.onTap,borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 16),
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isHovered? AppColor.blue.withOpacity(0.5): AppColor.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
