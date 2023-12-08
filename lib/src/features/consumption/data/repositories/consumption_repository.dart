import 'package:shared_preferences/shared_preferences.dart';
import 'package:susten_app/src/core/utils/http.dart';
import 'package:susten_app/src/features/consumption/data/models/ConsumptionData.dart';
import 'package:susten_app/src/features/consumption/data/models/Room.dart';
import 'package:susten_app/src/features/consumption/domain/repositories/consumptio_repository.dart';

class ConsumptionRepositoryImpl implements ConsumptionRepository {
  @override
  Future<RoomModel> createRoom({required String nome}) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final id = prefs.getString("userID") as String;

      final response = await MyHttpClient.post("/comodo",
          data: {'nome': nome.toLowerCase(), 'usuario': id});

      final room = RoomModel.fromJson(response.data);

      return room;
    } catch (e) {
      throw Exception("Error when creating room");
    }
  }

  @override
  Future<List<RoomModel>> getAllRooms() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final id = prefs.getString("userID") as String;

      final List<RoomModel> rooms = [];

      final response = await MyHttpClient.get("/comodo/all",
          queryParameters: {'usuario': id});

      for (var room in response.data) {
        rooms.add(RoomModel.fromJson(room));
      }

      return rooms;
    } catch (e) {
      throw Exception("Error while fetching user rooms");
    }
  }

  @override
  Future<List<ConsumptionData>> getConsumption() async {
    final prefs = await SharedPreferences.getInstance();

    final id = prefs.getString("userID") as String;

    final List<ConsumptionData> consumptionList = [];

    final response = await MyHttpClient.get("/recurso/all",
        queryParameters: {'usuario': id});

    for (var consumption in response.data) {
      consumptionList.add(ConsumptionData.fromJson(consumption));
    }

    return consumptionList;
  }
}
