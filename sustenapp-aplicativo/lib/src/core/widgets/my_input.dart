import 'package:flutter/material.dart';
import 'package:susten_app/src/core/theme/theme.dart';

class MyInput extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  final TextInputAction? inputAction;
  final TextInputType inputType;
  final bool isObscure;
  final Function(String?)? validator;
  final TextEditingController? controller;

  const MyInput(
      {Key? key,
      required this.label,
      required this.prefixIcon,
      this.inputAction = TextInputAction.next,
      required this.inputType,
      this.isObscure = false,
      required this.validator, 
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isObscure,
      keyboardType: inputType,
      textInputAction: inputAction,
      controller:controller ,
      style: TextStyle(
        color: darkGray.withOpacity(0.8),
        fontSize: 18,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
         errorStyle: const TextStyle(
          wordSpacing: 2
         ),
        hintText: label,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none
        ),
        filled: true,
        prefixIcon: Icon(
          prefixIcon,
          color: primaryColor,
        ),
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
