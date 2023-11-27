import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:susten_app/src/core/utils/http.dart';
import 'package:susten_app/src/core/utils/redirect.dart';
import 'package:susten_app/src/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:susten_app/src/features/authentication/presentation/providers/error_login.dart';
import 'package:susten_app/src/features/authentication/presentation/providers/user_data.dart';

class LoginUseCase {
  final AuthenticationRepository authenticationRepo;

  LoginUseCase({required this.authenticationRepo});

  void call({
    required String email,
    required String password,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    final error = ref.read(errorProvider.notifier);

    await authenticationRepo
        .login(email: email, password: password)
        .then((value) async {
      error.state = "";

      final Response response = await MyHttpClient.get("/usuario/email",
          queryParameters: {'email': email});

      final userName = ref.read(userNameProvider.notifier);
      final userEmail = ref.read(userEmailProvider.notifier);

      userEmail.state = response.data['email'];
      userName.state = response.data['nome'];

      final prefs = await SharedPreferences.getInstance();

      await prefs.setString("userID", response.data['id']);
      await prefs.setString("userName", response.data['nome']);
      await prefs.setString("userEmail", response.data['email']);

      redirectToPage("/tab_routes", context);
    }).catchError((err) {
      error.state = "Credenciasis invalidas";
    });
  }
}
