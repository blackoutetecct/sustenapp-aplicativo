import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/enums/consumption_detail_text_style.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/widgets/dialog.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/core/widgets/tab_screens_template.dart';
import 'package:susten_app/src/features/consumption/data/enums/consumption_detail_icon.dart';
import 'package:susten_app/src/features/consumption/data/repositories/esp_repository.dart';
import 'package:susten_app/src/features/consumption/presentation/providers/devices.dart';
import 'package:susten_app/src/features/consumption/presentation/screens/parameters/room_detail.dart';
import 'package:susten_app/src/features/consumption/presentation/widgets/DeviceCard.dart';
import 'package:susten_app/src/features/consumption/presentation/widgets/consumption_detail.dart';

class RoomDetail extends ConsumerStatefulWidget {
  const RoomDetail({
    Key? key,
  }) : super(key: key);

  @override
  _RoomDetailState createState() => _RoomDetailState();
}

class _RoomDetailState extends ConsumerState<RoomDetail> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final devicesState = ref.read(devicesProvider.notifier);

      final args =
          ModalRoute.of(context)!.settings.arguments as RoomDetailArguments;

      devicesState.state = args.devices;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RoomDetailArguments;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final dialog = MyCustomDialog();
          dialog.showMyDialog(context, MyCustomDialogType.DEVICE, args.id);
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.add, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: TabScreensTemplate(
          title: args.title,
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                // MARGIN
                Container(
                  height: constraints.maxHeight * 0.05,
                ),
                //TITULO CONSUMO
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxHeight * 0.05,
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
                // MARGIN
                Container(
                  height: constraints.maxHeight * 0.01,
                ),
                //CONSUMO
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
                          child: const ConsumptionDetail(
                            icon: ConsumptionDetailIcon.BOLT_THUNDER_BLUE,
                            value: "49",
                            type: 'ENERGIA',
                            price: 5.96,
                            textStyle: ConsumptionDetailTextStyle.SECONDARY,
                            titleStyle: ConsumptionDetailTextStyle.SECONDARY,
                          )),
                      SizedBox(
                        width: constraints.maxWidth * 0.4,
                        child: const ConsumptionDetail(
                          icon: ConsumptionDetailIcon.BOLT_THUNDER_YELLOW,
                          value: "491",
                          type: 'ENERGIA',
                          price: 50.96,
                          titleStyle: ConsumptionDetailTextStyle.PRIMARY,
                          textStyle: ConsumptionDetailTextStyle.SECONDARY,
                        ),
                      )
                    ],
                  ),
                ),
                // MARGIN
                Container(
                  height: constraints.maxWidth * 0.05,
                ),
                // DISPOSITIVOS TITLE
                Container(
                  child: Row(
                    children: [
                      Image.asset("assets/images/device-list.png"),
                      // MARGIN
                      Container(
                        width: constraints.maxWidth * 0.04,
                      ),
                      const Text(
                        "DISPOSITIVOS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: darkBrawn,
                        ),
                      )
                    ],
                  ),
                ),
                //MENSAGEM CASO NAO TENHA DISPOSITIVOS
                Visibility(
                  visible: ref.watch(devicesProvider).isEmpty,
                  child: const Expanded(
                    child: Center(
                      child: Text(
                        "Nenhum dispositivo cadastrado. Clique no ícone + para registrar um novo dispositivo.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                ),
                //DISPOSITIVOS
                Visibility(
                    visible: ref.watch(devicesProvider).isNotEmpty,
                    child: Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: ref.watch(devicesProvider).length,
                        itemBuilder: (context, index) {
                          return DeviceCard(
                            constrants: constraints,
                            name: ref.watch(devicesProvider)[index].nome,
                            port: ref.watch(devicesProvider)[index].porta,
                            espRepo: EspRepositoryImpl(),
                          );
                        },
                      ),
                    ))
              ],
            );
          })),
    );
  }
}
