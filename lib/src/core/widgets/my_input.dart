import 'package:flutter/material.dart';
import 'package:susten_app/src/core/theme/theme.dart';

class MyInput extends StatefulWidget {
  final String label;
  final IconData prefixIcon;
  final TextInputAction? inputAction;
  final TextInputType inputType;
  final bool isPassword;
  final Function(String?)? validator;
  final TextEditingController? controller;

  const MyInput(
      {Key? key,
      required this.label,
      required this.prefixIcon,
      this.inputAction = TextInputAction.next,
      required this.inputType,
      this.isPassword = false,
      required this.validator,
      this.controller})
      : super(key: key);

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  bool isPasswordVisible = false;

  void changePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (widget.validator != null) {
          return widget.validator!(value);
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.isPassword ? !isPasswordVisible : isPasswordVisible,
      keyboardType: widget.inputType,
      textInputAction: widget.inputAction,
      controller: widget.controller,
      style: TextStyle(
        color: darkGray.withOpacity(0.8),
        fontSize: 18,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        errorStyle: const TextStyle(wordSpacing: 2),
        hintText: widget.label,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        filled: true,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: primaryColor,
        ),
        suffixIcon: Visibility(
          visible: widget.isPassword,
            child: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            color: darkGray.withOpacity(0.8),
            size: 30,
          ),
          onPressed: changePasswordVisibility,
        )),
        fillColor: secondaryColor,
        hintStyle: TextStyle(
          color: lightGray.withOpacity(0.8),
          fontFamily: 'Poppins',
          fontSize: 15,
        ),
      ),
    );
  }
}
