import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/features/consumption/data/enums/consumption_detail_icon.dart';
import 'package:susten_app/src/features/consumption/data/models/ConsumptionData.dart';
import 'package:susten_app/src/features/consumption/presentation/providers/consumption.dart';
import 'package:susten_app/src/features/consumption/presentation/widgets/consumption_type.dart';
import 'package:susten_app/src/features/consumption/presentation/widgets/home_consumption_date_display.dart';

class HomeConsumptionCard extends ConsumerStatefulWidget {
  final BoxConstraints parentConstraints;

  const HomeConsumptionCard({Key? key, required this.parentConstraints})
      : super(key: key);

  @override
  ConsumerState<HomeConsumptionCard> createState() =>
      _HomeConsumptionCardState();
}

class _HomeConsumptionCardState extends ConsumerState<HomeConsumptionCard> {
  @override
  Widget build(BuildContext context) {
    final ConsumptionData hidricData = ref.watch(hidricDataProvider);
    final ConsumptionData electricData = ref.watch(electricDataProvider);

    return Container(
      width: double.infinity,
      height: widget.parentConstraints.maxHeight * 0.3,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.only(
            left: constraints.maxWidth * 0.04,
            right: constraints.maxWidth * 0.04,
            top: constraints.maxHeight * 0.065,
          ),
          child: Column(
            children: [
              HomeConsumptionDateDisplay(parentConstraints: constraints),
              Padding(
                padding: EdgeInsets.only(
                  top: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.025,
                  right: constraints.maxWidth * 0.02,
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConsumptionType(
                        parentConstraints: constraints,
                        type: "ENERGIA",
                        icon: ConsumptionDetailIcon.BOLT_YELLOW,
                        price: electricData.estimatedprice.roundToDouble(),
                        value: electricData.consumption.toString(),
                      ),
                      ConsumptionType(
                        parentConstraints: constraints,
                        type: "ÁGUA",
                        icon: ConsumptionDetailIcon.FAUCET_LEFT,
                        price: hidricData.estimatedprice.roundToDouble(),
                        value: hidricData.consumption.toString(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
