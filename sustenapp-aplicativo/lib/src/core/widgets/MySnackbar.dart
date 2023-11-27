import 'package:flutter/material.dart';

enum MySnackBarType { SUCCESS, ERROR }

showMySnackBar({
  required BuildContext context,
  required String text,
  required MySnackBarType type,
}) {
  final snackBar = SnackBar(
    content: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: type == MySnackBarType.SUCCESS ? Colors.green : Colors.red,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
