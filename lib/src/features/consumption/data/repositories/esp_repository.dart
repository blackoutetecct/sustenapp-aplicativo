import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/features/consumption/data/models/Consumption.dart';
import 'package:susten_app/src/features/consumption/data/models/GetPortResponse.dart';
import 'package:susten_app/src/features/consumption/domain/repositories/esp_repository.dart';
import 'package:susten_app/src/features/consumption/presentation/providers/esp_ip.dart';

class EspRepositoryImpl implements EspRepository {
  Dio client = Dio();

  @override
  Future<GetPortResponse> getPort(WidgetRef ref) async {
    final espIp = ref.watch(EspIpProvider);

    final response = await client
        .post("http://$espIp/", data: {'comando': 'disponibilidade'});
    return GetPortResponse.fromJson(response.data);
  }

  @override
  Future assignPort(int port, WidgetRef ref) async {
    final espIp = ref.watch(EspIpProvider);

    await client.post("http://$espIp/",
        data: {"comando": "declaracao", "tipo": "dispositivo", "porta": port});
  }

  @override
  Future<bool> isDeviceOn(int port, WidgetRef ref) async {
    final espIp = ref.watch(EspIpProvider);

    final response = await client.post("http://$espIp/", data: {
      "comando": "dispositivo",
      "porta": port,
    });

    return response.data["estado"] == 1;
  }

  @override
  Future<void> changeDeviceStatus(int port, WidgetRef ref) async {
    final espIp = ref.watch(EspIpProvider);

    await client.post("http://$espIp/", data: {
      "comando": "controlador",
      "porta": port,
    });
  }

  @override
  Future<Consumption> getConsumption(
      String type, bool renewable, WidgetRef ref) async {
    try {
      final espIp = ref.watch(EspIpProvider);

      final response = await client.post(
        "http://$espIp/",
        data: {"comando": "consumo", "tipo": type, "renovavel": renewable},
      );

      return Consumption.fromJson(response.data);
    } catch (err) {
      
      return Consumption(consumo: 0, unidade: "l");
    }
  }
}
