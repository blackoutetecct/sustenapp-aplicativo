import 'package:susten_app/src/core/utils/esp_http_client.dart';
import 'package:susten_app/src/features/consumption/data/models/GetPortResponse.dart';
import 'package:susten_app/src/features/consumption/domain/repositories/esp_repository.dart';

class EspRepositoryImpl implements EspRepository {
  @override
  Future<GetPortResponse> getPort() async {
    final response =
        await MyEspHttpClient.post("/", data: {'comando': 'disponibilidade'});
    return GetPortResponse.fromJson(response.data);
  }

  @override
  Future assignPort(int port) async {
    await MyEspHttpClient.post("/",
        data: {"comando": "declaracao", "tipo": "dispositivo", "porta": port});
  }

  @override
  Future<bool> isDeviceOn(int port) async {
    final response = await MyEspHttpClient.post("/", data: {
      "comando": "dispositivo",
      "porta": port,
    });

    return response.data["estado"] == 1;
  }

  @override
  Future<void> changeDeviceStatus(int port) async {
    await MyEspHttpClient.post("/", data: {
      "comando": "controlador",
      "porta": port,
    });
  }
}
