import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:susten_app/src/core/utils/http.dart';
import 'package:susten_app/src/core/utils/redirect.dart';
import 'package:susten_app/src/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:susten_app/src/features/authentication/presentation/providers/register_error.dart';
import 'package:susten_app/src/features/authentication/presentation/providers/user_data.dart';

class RegisterUseCase {
  final AuthenticationRepository authenticationRepo;

  RegisterUseCase({required this.authenticationRepo});

  Future<void> call({
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController cpfController,
    required TextEditingController passwordController,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    final registerErrorProvider = ref.read(registerError.notifier);
    await authenticationRepo
        .register(
      name: nameController.text,
      email: emailController.text,
      cpf: cpfController.text,
      password: passwordController.text,
    )
        .then((value) async {
      registerErrorProvider.state = "";

      await authenticationRepo
          .login(email: emailController.text, password: passwordController.text)
          .then((_) async {
        final Response response = await MyHttpClient.get("/usuario/email",
            queryParameters: {'email': emailController.text});

        final userName = ref.read(userNameProvider.notifier);
        final userEmail = ref.read(userEmailProvider.notifier);

        userEmail.state = response.data['email'];
        userName.state = response.data['nome'];

        final prefs = await SharedPreferences.getInstance();

        await prefs.setString("userID", response.data['id']);
        await prefs.setString("userName", response.data['nome']);
        await prefs.setString("userEmail", response.data['email']);

        redirectWithPopToPage("/tab_routes", context);
      });
    }).catchError((err) {
      registerErrorProvider.state = "Usuário já cadastrado.";
    });
  }
}
