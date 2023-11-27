import 'package:susten_app/src/features/consumption/data/models/ConsumptionData.dart';
import 'package:susten_app/src/features/consumption/data/models/Room.dart';

abstract class ConsumptionRepository {

  Future<RoomModel> createRoom({required String nome});

  Future<List<RoomModel>> getAllRooms();

  Future<List<ConsumptionData>> getConsumption();

}