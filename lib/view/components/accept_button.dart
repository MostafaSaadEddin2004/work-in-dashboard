import 'package:flutter/material.dart';

class AcceptButton extends StatefulWidget {
  const AcceptButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.color});
  final void Function() onPressed;
  final String text;
  final Color color;
  @override
  State<AcceptButton> createState() => AacceptButtonState();
}

class AacceptButtonState extends State<AcceptButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: const ButtonStyle(
          mouseCursor: MaterialStateMouseCursor.clickable,
        ),
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
              fontSize: 14,
              color: isHover == false
                  ? widget.color
                  : widget.color.withOpacity(0.5)),
        ));
  }
}
