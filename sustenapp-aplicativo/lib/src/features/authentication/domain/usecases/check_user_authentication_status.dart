import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:susten_app/src/core/utils/redirect.dart';
import 'package:susten_app/src/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:susten_app/src/features/authentication/presentation/providers/user_data.dart';

class CheckUserAuthenticationStatus {
  AuthenticationRepository authenticationRepository;
  BuildContext context;
  WidgetRef ref;

  CheckUserAuthenticationStatus(
      {required this.authenticationRepository,
      required this.context,
      required this.ref,});

  Future<void> call() async {
    bool isUserAlreadyLogged =
        await authenticationRepository.isUserAlreadyLogged();

    if (isUserAlreadyLogged) {

      final prefs = await SharedPreferences.getInstance();

      final userName = prefs.getString("userName") ?? "";
      final userEmail = prefs.getString("userEmail") ?? "";

      final userNameState = ref.read(userNameProvider.notifier);
      final userEmailState = ref.read(userEmailProvider.notifier);

      userNameState.state = userName;
      userEmailState.state = userEmail;

      redirectToPage("/tab_routes", context);
    } else {
      redirectToPage("/welcome", context);
    }
  }
}
