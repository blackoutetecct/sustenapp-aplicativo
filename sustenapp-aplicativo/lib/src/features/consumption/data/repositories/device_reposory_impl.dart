import 'package:susten_app/src/core/utils/http.dart';
import 'package:susten_app/src/features/consumption/data/models/Device.dart';
import 'package:susten_app/src/features/consumption/domain/repositories/device_repository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  @override
  create({required String name, required String room,required int port}) async {
    try {

      final response = await MyHttpClient.post("/dispositivo", data: {
        'comodo': room,
        'nome': name,
        'porta': port,
      });
      return DeviceModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Error while creating device");
    }
  }
}
