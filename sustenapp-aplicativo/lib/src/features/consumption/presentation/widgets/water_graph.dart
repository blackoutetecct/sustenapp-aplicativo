import 'package:flutter/material.dart';
import 'package:susten_app/src/core/enums/water_graph_bar_style.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/features/consumption/presentation/widgets/water_graph_bar.dart';

class WaterGraph extends StatelessWidget {
  final BoxConstraints parentConstraints;
  final List<String> labels;

  const WaterGraph({
    Key? key,
    required this.parentConstraints,
    required this.labels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, graphConstraints) {
      return Container(
        width: parentConstraints.maxWidth,
        decoration: BoxDecoration(
        color: Colors.white,
          borderRadius:
              BorderRadius.circular(parentConstraints.maxWidth * 0.08),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              SizedBox(
                height: graphConstraints.maxHeight,
                width: graphConstraints.maxWidth * 0.20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: labels.map(
                    (item) => MyText(
                      text: "${item}m³",
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: graphConstraints.maxHeight * 0.1),
                child: SizedBox(
                  width: graphConstraints.maxWidth * 0.76,
                  height: graphConstraints.maxHeight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WaterGraphBar(
                        graphConstraints: graphConstraints,
                        consumption: 1000,
                      ),
                      WaterGraphBar(
                        graphConstraints: graphConstraints,
                        consumption: 2000,
                        barStyle: WaterGraphBarStyle.SECONDARY,
                      ),
                      WaterGraphBar(
                        graphConstraints: graphConstraints,
                        consumption: 3000,
                      ),
                      WaterGraphBar(
                        graphConstraints: graphConstraints,
                        consumption: 4000,
                        barStyle: WaterGraphBarStyle.SECONDARY,
                      ),
                      WaterGraphBar(
                        graphConstraints: graphConstraints,
                        consumption: 4900,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
