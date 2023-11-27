import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:susten_app/src/core/utils/redirect.dart';

class LogoutUseCase {
  call(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    redirectToPage('/welcome', context);

  }
}
