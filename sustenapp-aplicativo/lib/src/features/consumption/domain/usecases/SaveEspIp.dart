import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:susten_app/src/features/consumption/presentation/providers/esp_ip.dart';

class SaveEspIpUseCase {
  call(String ip, WidgetRef ref) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("esp_ip", ip);

    final espState = ref.read(EspIpProvider.notifier);
    espState.state = ip;
  }
}
