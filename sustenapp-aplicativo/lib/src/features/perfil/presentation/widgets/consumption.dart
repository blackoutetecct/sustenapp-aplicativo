import 'package:flutter/material.dart';
import 'package:susten_app/src/core/theme/theme.dart';

class Consumption extends StatelessWidget {
  final String text;
  final String value;
  final String type;
  final BoxConstraints constraints;

  const Consumption(
      {Key? key,
      required this.text,
      required this.type,
      required this.value,
      required this.constraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: constraints.maxWidth * 0.46,
          height: constraints.maxHeight * 0.18,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(constraints.maxWidth * 0.05)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              Text(
                "$value $type",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: yellowColor),
              )
            ],
          ),
        ),
        Positioned(
          bottom: constraints.maxHeight * 0.012,
          right: constraints.maxHeight * 0.01,
          child: Image.asset("assets/images/house.png"),
        )
      ],
    );
  }
}
