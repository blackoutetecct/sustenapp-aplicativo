import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/features/consumption/data/repositories/consumption_repository.dart';
import 'package:susten_app/src/features/consumption/data/repositories/device_reposory_impl.dart';
import 'package:susten_app/src/features/consumption/data/repositories/esp_repository.dart';
import 'package:susten_app/src/features/consumption/domain/usecases/CreateDevice.dart';
import 'package:susten_app/src/features/consumption/domain/usecases/CreateRoom.dart';

enum MyCustomDialogType { ROOM, DEVICE }

class MyCustomDialog {
  showMyDialog(
      BuildContext context, MyCustomDialogType type, String? roomId) async {
    TextEditingController textController = TextEditingController();
    CreateRoomUseCase createRoomUseCase =
        CreateRoomUseCase(consumptionRepo: ConsumptionRepositoryImpl());

    CreateDeviceUseCase createDeviceUseCase =
        CreateDeviceUseCase(deviceRepo: DeviceRepositoryImpl(), espRepo: EspRepositoryImpl());

    late String textType;

    // ignore: unrelated_type_equality_checks
    if (type == MyCustomDialogType.DEVICE) {
      textType = "Dispositivo";
    } else {
      textType = "Cômodo";
    }

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            insetPadding: EdgeInsets.zero,
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height / 1.7),
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    // CLOSE BUTTON
                    Align(
                      alignment: Alignment.centerRight,
                      child: TapRegion(
                        onTapInside: Navigator.of(context).pop,
                        child: const Icon(
                          Icons.close,
                          size: 35,
                        ),
                      ),
                    ),
                    // ADD ICON + TITLE
                    Container(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(999)),
                            child: Padding(
                              padding:
                                  EdgeInsets.all(constraints.maxWidth * 0.01),
                              child: Icon(
                                Icons.add,
                                size: constraints.maxWidth * 0.12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            "  Add novo $textType",
                            style: const TextStyle(
                              color: darkBrawn,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lexend',
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight * 0.023,
                    ),
                    // INPUT
                    TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: secondaryColor,
                        hintText: 'Nome do $textType',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    // ADD BUTTON
                    Consumer(
                      builder: (_, ref, __) {
                        return MaterialButton(
                          onPressed: () {
                            if (type == MyCustomDialogType.ROOM) {
                              createRoomUseCase.call(
                                textController: textController,
                                context: context,
                                ref: ref,
                              );
                            } else {
                              createDeviceUseCase.call(
                                textController: textController,
                                room: roomId as String,
                                ref: ref,
                                context: context
                              );
                            }
                          },
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          color: primaryColor,
                          child: SizedBox(
                            width: constraints.maxWidth * 0.95,
                            height: constraints.maxWidth * 0.20,
                            child: const Center(
                              child: Text(
                                "ADICIONAR",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
