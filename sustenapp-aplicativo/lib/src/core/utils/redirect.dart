import 'package:flutter/material.dart';

void redirectToPage(String routeName, BuildContext context){
  Navigator.pushNamed(context, routeName);
}

redirectToPreviousPage(BuildContext context){
  Navigator.pop(context);
}