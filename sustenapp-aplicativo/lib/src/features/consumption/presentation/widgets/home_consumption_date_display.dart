import 'package:flutter/material.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/utils/dateTimeInfo.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';

class HomeConsumptionDateDisplay extends StatelessWidget {
  final BoxConstraints parentConstraints;

  const HomeConsumptionDateDisplay({Key? key, required this.parentConstraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final monthDay = DateTimeInfo.getDayOfMonth();
    final month = DateTimeInfo.getMonth();
    final year = DateTimeInfo.getYear();

    final formattedDate = "$monthDay, $month, $year";

    return Container(
      height: parentConstraints.maxHeight * 0.27,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: parentConstraints.maxWidth * 0.1,
            right: parentConstraints.maxWidth * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const MyText(
              text: "CONSUMOS",
              color: primaryColor,
              fontSize: 16,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.bold,
            ),
            Container(
              width: parentConstraints.maxWidth * 0.42,
              height: parentConstraints.maxHeight * 0.22,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.date_range,
                    color: yellowColor,
                  ),
                  SizedBox(
                    width: parentConstraints.maxWidth * 0.01,
                  ),
                  MyText(
                    text: formattedDate,
                    color: Colors.white,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
