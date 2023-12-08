import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/features/consumption/domain/repositories/consumptio_repository.dart';
import 'package:susten_app/src/features/consumption/presentation/providers/Rooms.dart';

class GetAllRoomsUseCase {
  final ConsumptionRepository consumptionRepo;

  GetAllRoomsUseCase({required this.consumptionRepo});

  call({required WidgetRef ref}) async {
    final rooms = await consumptionRepo.getAllRooms();

    final roomsState = ref.read(roomsProvider.notifier);

    roomsState.state = rooms;
  }
}
