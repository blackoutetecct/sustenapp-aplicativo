import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/enums/consumption_detail_text_style.dart';
import 'package:susten_app/src/core/enums/consumption_tempalte_icon_position.dart';
import 'package:susten_app/src/core/enums/consumption_template_container_size.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/core/widgets/tab_screens_template.dart';
import 'package:susten_app/src/features/consumption/data/enums/consumption_detail_icon.dart';
import 'package:susten_app/src/features/consumption/presentation/providers/consumption.dart';
import 'package:susten_app/src/features/consumption/presentation/widgets/consumption_detail.dart';
import 'package:susten_app/src/features/consumption/presentation/widgets/water_graph.dart';

class WaterScreen extends ConsumerStatefulWidget {
  const WaterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends ConsumerState<WaterScreen> {
  @override
  Widget build(BuildContext context) {
    final hidricData = ref.watch(hidricDataProvider);

    return TabScreensTemplate(
      iconPosition: ConsumptionTemplateIconPosition.RIGHT,
      containerSize: ConsumptionTemplateContainerSize.SMALL,
      waterImage: true,
      title: "ÁGUA",
      includesBackButton: true,
      child: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: constraints.maxHeight * 0.1,
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
                          icon: ConsumptionDetailIcon.FAUCET_RIGHT,
                          value: hidricData.averageDailyConsumption / 30,
                          type: 'ÁGUA',
                          price: (hidricData.estimatedprice / 30),
                          textStyle: ConsumptionDetailTextStyle.SECONDARY,
                        )),
                    SizedBox(
                        width: constraints.maxWidth * 0.4,
                        child: ConsumptionDetail(
                          icon: ConsumptionDetailIcon.CUP_BLUE,
                          value: (hidricData.consumption),
                          type: 'ÁGUA',
                          price:
                              hidricData.estimatedprice,
                          titleStyle: ConsumptionDetailTextStyle.SECONDARY,
                          textStyle: ConsumptionDetailTextStyle.SECONDARY,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.04,
              ),
              const MyText(
                text: "HISTÓRICO DE CONSUMO",
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: darkBrawn,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              Expanded(
                child: WaterGraph(
                  parentConstraints: constraints,
                  labels: const ["5000", "4000", "3000", "2000", "1000"],
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.21,
              ),
            ],
          ),
        );
      }),
    );
  }
}
