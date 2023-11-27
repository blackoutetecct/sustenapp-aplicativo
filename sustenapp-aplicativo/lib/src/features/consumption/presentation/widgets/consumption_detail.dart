import 'package:flutter/material.dart';
import 'package:susten_app/src/core/enums/consumption_detail_text_style.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/features/consumption/data/enums/consumption_detail_icon.dart';

class ConsumptionDetail extends StatelessWidget {
  final ConsumptionDetailIcon icon;
  final String value;
  final String type;
  final double price;
  final ConsumptionDetailTextStyle? titleStyle;
  final ConsumptionDetailTextStyle? textStyle;

  const ConsumptionDetail({
    Key? key,
    required this.icon,
    required this.value,
    required this.price,
    required this.type,
    this.titleStyle = ConsumptionDetailTextStyle.PRIMARY,
    this.textStyle = ConsumptionDetailTextStyle.PRIMARY,
  }) : super(key: key);

  String getIconPath() {
    String iconPath = "";
    switch (icon) {
      case ConsumptionDetailIcon.BOLT_YELLOW:
        iconPath = "assets/images/bolt-yellow.png";
        break;
      case ConsumptionDetailIcon.BOLT_THUNDER_BLUE:
        iconPath = "assets/images/bolt-thunder-blue.png";
        break;
      case ConsumptionDetailIcon.BOLT_THUNDER_YELLOW:
        iconPath = "assets/images/bolt-thunder-yellow.png";
        break;
      case ConsumptionDetailIcon.CUP_BLUE:
        iconPath = "assets/images/cup-blue.png";
        break;
      case ConsumptionDetailIcon.FAUCET_LEFT:
        iconPath = "assets/images/faucet-left.png";
        break;
      case ConsumptionDetailIcon.FAUCET_RIGHT:
        iconPath = "assets/images/faucet-right.png";
        break;
    }
    return iconPath;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        child: Row(
          children: [
            Image.asset(
              getIconPath(),
              width: constraint.maxWidth * 0.25,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: "$value${type == "ÁGUA" ? 'ml' : 'Kw/h'}",
                    color: titleStyle == ConsumptionDetailTextStyle.PRIMARY
                        ? yellowColor
                        : primaryColor,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  MyText(
                    text: "R\$ ${price.toString().replaceFirst('.', ',')}",
                    color: textStyle == ConsumptionDetailTextStyle.PRIMARY
                        ? secondaryColor
                        : const Color(0xFF1E1E1E),
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
