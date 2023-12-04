import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/widgets/MySnackbar.dart';
import 'package:susten_app/src/features/consumption/data/models/GetPortResponse.dart';
import 'package:susten_app/src/features/consumption/domain/repositories/device_repository.dart';
import 'package:susten_app/src/features/consumption/domain/repositories/esp_repository.dart';
import 'package:susten_app/src/features/consumption/presentation/providers/devices.dart';

class CreateDeviceUseCase {
  final DeviceRepository deviceRepo;
  final EspRepository espRepo;

  CreateDeviceUseCase({required this.deviceRepo, required this.espRepo});

  call({
    required TextEditingController textController,
    required String room,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    GetPortResponse portResponse = await espRepo.getPort(ref);

    await deviceRepo
        .create(
            name: textController.text.toLowerCase(),
            room: room,
            port: portResponse.port)
        .then((value) {
      final devicesState = ref.read(devicesProvider.notifier);
      devicesState.state = [...devicesState.state, value];

      espRepo.assignPort(portResponse.port, ref).then((value) {
        showMySnackBar(
          context: context,
          text: "Dispositivo cadastrado com sucesso",
          type: MySnackBarType.SUCCESS,
        );

        Navigator.of(context).pop();

        textController.clear();
      });
    }).catchError((error) {
      Navigator.of(context).pop();

      showMySnackBar(
        context: context,
        text: "Erro ao cadastrar dispositivo.",
        type: MySnackBarType.ERROR,
      );
    });
  }
}
