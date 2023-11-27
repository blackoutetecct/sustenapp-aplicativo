import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/enums/consumption_detail_text_style.dart';
import 'package:susten_app/src/core/enums/consumption_template_container_size.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/core/widgets/tab_screens_template.dart';
import 'package:susten_app/src/features/consumption/data/enums/consumption_detail_icon.dart';
import 'package:susten_app/src/features/consumption/data/models/ConsumptionData.dart';
import 'package:susten_app/src/features/consumption/presentation/providers/consumption.dart';
import 'package:susten_app/src/features/consumption/presentation/widgets/consumption_detail.dart';
import 'package:susten_app/src/features/consumption/presentation/widgets/rooms_list.dart';

class EnergyScreen extends ConsumerStatefulWidget {
  const EnergyScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<EnergyScreen> createState() => _EnergyScreenState();
}

class _EnergyScreenState extends ConsumerState<EnergyScreen> {
  @override
  Widget build(BuildContext context) {
    ConsumptionData electricData = ref.watch(electricDataProvider);

    return TabScreensTemplate(
      title: "ENERGIA",
      containerSize: ConsumptionTemplateContainerSize.SMALL,
      rainImage: true,
      includesBackButton: true,
      child: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.12,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxHeight * 0.03,
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: "HOJE",
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: darkBrawn,
                      ),
                      MyText(
                        text: "ESTE MÊS",
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: darkBrawn,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.16,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(constraints.maxHeight * 0.05),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: constraints.maxWidth * 0.4,
                        child: ConsumptionDetail(
                          icon: ConsumptionDetailIcon.BOLT_THUNDER_BLUE,
                          value: electricData.averageDailyConsumption
                              .toStringAsPrecision(2),
                          type: 'ENERGIA',
                          price: (electricData.estimatedprice / 30).roundToDouble(),
                          textStyle: ConsumptionDetailTextStyle.SECONDARY,
                          titleStyle: ConsumptionDetailTextStyle.SECONDARY,
                        )),
                    SizedBox(
                        width: constraints.maxWidth * 0.4,
                        child: ConsumptionDetail(
                          icon: ConsumptionDetailIcon.BOLT_THUNDER_YELLOW,
                          value: electricData.consumption.toString(),
                          type: 'ENERGIA',
                          price: electricData.estimatedprice.roundToDouble(),
                          titleStyle: ConsumptionDetailTextStyle.PRIMARY,
                          textStyle: ConsumptionDetailTextStyle.SECONDARY,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              const MyText(
                text: "CÔMODOS",
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: darkBrawn,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.03,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.38,
                child: const RoomsList(),
              )
            ],
          ),
        );
      }),
    );
  }
}
