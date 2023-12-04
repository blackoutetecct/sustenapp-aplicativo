import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:susten_app/src/core/utils/http.dart';
import 'package:susten_app/src/features/consumption/data/models/Consumption.dart';
import 'package:susten_app/src/features/consumption/domain/repositories/esp_repository.dart';
import 'package:susten_app/src/features/consumption/presentation/providers/esp_ip.dart';

class RegisterConsumptionUseCase {
  EspRepository espRepo;

  RegisterConsumptionUseCase({required this.espRepo});

  call(WidgetRef ref) async {
    final espIp = ref.watch(EspIpProvider);

    if (espIp.isEmpty) {
      return;
    }

    Consumption hidricNonRenewable =
        await espRepo.getConsumption("hidrico", false, ref);
    Consumption electricNonRenewable =
        await espRepo.getConsumption("eletrico", false, ref);

    final prefs = await SharedPreferences.getInstance();

    String userId = prefs.getString("userID") as String;

    final response = await MyHttpClient.get("/recurso/all?usuario=$userId");
    List<dynamic> data = response.data;

    for (var item in data) {
      if (item["tipo"] == "ELETRICO" && item["renovavel"] == false) {
        await MyHttpClient.post("/consumo", data: {
          "recurso": item["id"],
          "consumo": electricNonRenewable.consumo
        });
      }

      if (item["tipo"] == "HIDRICO" && item["renovavel"] == false) {
        await MyHttpClient.post(
          "/consumo",
          data: {"recurso": item["id"], "consumo": hidricNonRenewable.consumo},
        );
      }
    }
  }
}
