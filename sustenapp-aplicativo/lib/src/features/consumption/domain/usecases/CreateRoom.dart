import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/widgets/MySnackbar.dart';
import 'package:susten_app/src/features/consumption/domain/repositories/consumptio_repository.dart';
import 'package:susten_app/src/features/consumption/presentation/providers/Rooms.dart';

class CreateRoomUseCase {
  final ConsumptionRepository consumptionRepo;

  CreateRoomUseCase({required this.consumptionRepo});

  call(
      {required TextEditingController textController,
      required BuildContext context,
      required WidgetRef ref}) async {
    await consumptionRepo.createRoom(nome: textController.text).then((room) {
      textController.clear();
      Navigator.of(context).pop();
      showMySnackBar(
        context: context,
        text: "Cômodo cadastrada com sucesso.",
        type: MySnackBarType.SUCCESS,
      );

      final roomState = ref.read(roomsProvider.notifier);
      roomState.state = [...roomState.state, room];
    }).catchError((error) {
      Navigator.of(context).pop();
      showMySnackBar(
        context: context,
        text: "Erro ao cadastrar cômodo.",
        type: MySnackBarType.ERROR,
      );
    });
  }
}
