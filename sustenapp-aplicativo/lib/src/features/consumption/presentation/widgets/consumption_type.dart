import 'package:flutter/material.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/features/consumption/data/enums/consumption_detail_icon.dart';
import 'package:susten_app/src/features/consumption/presentation/widgets/consumption_detail.dart';

class ConsumptionType extends StatelessWidget {
  final BoxConstraints parentConstraints;
  final String type;
  final ConsumptionDetailIcon icon;
  final String value;
  final double price;

  const ConsumptionType({
    Key? key,
    required this.parentConstraints,
    required this.type,
    required this.icon,
    required this.value,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: parentConstraints.maxWidth * 0.42,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: type,
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: parentConstraints.maxHeight * 0.08,
            ),
            ConsumptionDetail(
              type: type,
              icon: icon,
              price: price.toDouble(),
              value: value,
            )
          ],
        ));
  }
}
