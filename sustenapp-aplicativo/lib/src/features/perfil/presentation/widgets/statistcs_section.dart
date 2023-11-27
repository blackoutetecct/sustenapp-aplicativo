import 'package:flutter/material.dart';
import 'package:susten_app/src/core/enums/active_perfil_section.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/utils/dateTimeInfo.dart';
import 'package:susten_app/src/features/perfil/presentation/widgets/consumption.dart';
import 'package:susten_app/src/features/perfil/presentation/widgets/perfil_menu.dart';
import 'package:susten_app/src/features/perfil/presentation/widgets/statistic_chart/bar.dart';
import 'package:susten_app/src/features/perfil/presentation/widgets/statistic_chart/label.dart';

class StatisticsSection extends StatelessWidget {
  final BoxConstraints parentConstraints;
  final ActivePerfilSectionEnum perfilState;

  const StatisticsSection(
      {Key? key, required this.parentConstraints, required this.perfilState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date =
        "  ${DateTimeInfo.getDayOfMonth()} ${DateTimeInfo.getMonth()} - ${DateTimeInfo.getYear()}  ";

    return Column(
      children: [
        PerfilMenu(
            parentConstraints: parentConstraints, perfilState: perfilState),
        SizedBox(
          height: parentConstraints.maxHeight * 0.05,
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: MaterialButton(
                onPressed: () {},
                color: Colors.white,
                minWidth: parentConstraints.maxWidth * 0.05,
                height: parentConstraints.maxHeight * 0.07,
                child: Image.asset(
                  "assets/images/left.png",
                  height: parentConstraints.maxHeight * 0.06,
                  width: parentConstraints.maxWidth * 0.06,
                ),
              ),
            ),
            Text(
              date,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700, color: darkBrawn),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: MaterialButton(
                onPressed: () {},
                color: Colors.white,
                minWidth: parentConstraints.maxWidth * 0.05,
                height: parentConstraints.maxHeight * 0.07,
                child: Image.asset(
                  "assets/images/right.png",
                  height: parentConstraints.maxHeight * 0.06,
                  width: parentConstraints.maxWidth * 0.06,
                ),
              ),
            )
          ],
        ),
        // Margnin
        Container(
          height: parentConstraints.maxHeight * 0.05,
        ),
        // Chart
        SizedBox(
          width: parentConstraints.maxWidth,
          height: parentConstraints.maxHeight * 0.25,
          child: Row(
            children: [
              //Left Labels
              SizedBox(
                width: parentConstraints.maxWidth * 0.13,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ChartLabel(label: "20", money: true),
                    ChartLabel(label: "15", money: true),
                    ChartLabel(label: "10", money: true),
                    ChartLabel(label: "5", money: true),
                    ChartLabel(label: "0", money: true),
                  ],
                ),
              ),

              //Bars
              SizedBox(
                width: parentConstraints.maxWidth * 0.82,
                height: parentConstraints.maxHeight * 0.35,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Bar(constraints: parentConstraints, percentage: 15),
                    Bar(constraints: parentConstraints, percentage: 25),
                    Bar(constraints: parentConstraints, percentage: 35),
                    Bar(constraints: parentConstraints, percentage: 45),
                    Bar(constraints: parentConstraints, percentage: 55),
                    Bar(constraints: parentConstraints, percentage: 65),
                    Bar(constraints: parentConstraints, percentage: 75),
                  ],
                ),
              )
            ],
          ),
        ),
        //Bottom labels
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: parentConstraints.maxWidth * 0.82,
            height: parentConstraints.maxHeight * 0.08,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChartLabel(label: "SEG"),
                ChartLabel(label: "TER"),
                ChartLabel(label: "QUA"),
                ChartLabel(label: "QUI"),
                ChartLabel(label: "SEX"),
                ChartLabel(label: "SAB"),
                ChartLabel(label: "DOM"),
              ],
            ),
          ),
        ),
        // Consumos
        Container(
          child: Row(
            children: [
              Consumption(
                text: "ENERGIA TOTAL",
                type: "Kw/h",
                value: "80.40",
                constraints: parentConstraints,
              ),
              Container(
                width: parentConstraints.maxWidth * 0.02,
              ),
              Consumption(
                text: "ENERGIA TOTAL",
                type: "Kw/h",
                value: "80.40",
                constraints: parentConstraints,
              )
            ],
          ),
        ),
        //Margin
        Container(
          height: parentConstraints.maxHeight * 0.015,
        ),
        Container(
          child: Row(
            children: [
              Consumption(
                text: "ENERGIA TOTAL",
                type: "Kw/h",
                value: "80.40",
                constraints: parentConstraints,
              ),
              Container(
                width: parentConstraints.maxWidth * 0.02,
              ),
              Consumption(
                text: "ENERGIA TOTAL",
                type: "Kw/h",
                value: "80.40",
                constraints: parentConstraints,
              )
            ],
          ),
        )
      ],
    );
  }
}
