import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:susten_app/src/core/widgets/ip_dialog.dart';
import 'package:susten_app/src/features/consumption/presentation/providers/esp_ip.dart';

class GetEspIpUseCase {
  Future<void> call(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // if (true) {
    //   await prefs.remove("esp_ip");
    //   return;
    // }

    String? ip = prefs.getString("esp_ip");

    if (ip is String) {
      final espState = ref.read(EspIpProvider.notifier);
      espState.state = ip;
      return;
    }

    EspIpDialog.showMyDialog(context);
  }

  static saveEspIp(String ip) {}
}
