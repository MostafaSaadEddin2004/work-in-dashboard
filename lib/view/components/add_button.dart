import 'package:flutter/material.dart';
import 'package:work_in_dashboard/view/components/loading.dart';

class AddButton extends StatefulWidget {
  const AddButton({
    super.key,
    this.onPressed,
    required this.text,
    this.isAddLoading = false,
    required this.color,
  });
  final void Function()? onPressed;
  final String text;
  final bool isAddLoading;
  final Color color;
  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  bool isHovered = false;
  late bool isAddLoading = widget.isAddLoading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      onTap: widget.onPressed,
      mouseCursor: MaterialStateMouseCursor.clickable,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          margin: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isHovered ? widget.color.withOpacity(0.5) : widget.color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: isAddLoading == false
              ? Text(
                  widget.text,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              : const Loading()),
    );
  }
}
