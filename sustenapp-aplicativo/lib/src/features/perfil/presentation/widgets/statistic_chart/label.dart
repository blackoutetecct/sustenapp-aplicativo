import 'package:flutter/material.dart';
import 'package:susten_app/src/core/theme/theme.dart';

class ChartLabel extends StatelessWidget {

  final String label;
  final bool? money;

  const ChartLabel({super.key, required this.label, this.money = false});

  @override
  Widget build(BuildContext context) {
    final label = money == true ? "\$${this.label}" : this.label;
    return  Text(label, style: const TextStyle(
      color: primaryColor,
      fontSize: 20,
      fontWeight: FontWeight.bold
    ),);
  }
}