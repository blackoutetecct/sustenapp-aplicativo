import 'package:flutter/material.dart';
import 'package:susten_app/src/core/theme/theme.dart';

class MyButton extends StatefulWidget {
  final String text;
  final bool border;
  final void Function() onTap;

  const MyButton(
      {Key? key, required this.text, this.border = false, required this.onTap})
      : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  late final BorderSide borderStyle;

  @override
  void initState() {
    super.initState();
    borderStyle = widget.border == true
        ? const BorderSide(
            color: Colors.white,
            width: 2,
          )
        : BorderSide.none;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final fontSize = screenWidth * 0.040;
    final buttonSize = screenHeight * 0.070;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: MaterialButton(
        onPressed: widget.onTap,
        color: primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), side: borderStyle),
        minWidth: double.infinity,
        height: buttonSize,
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
