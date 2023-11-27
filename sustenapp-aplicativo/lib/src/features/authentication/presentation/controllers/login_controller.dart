import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/features/authentication/domain/usecases/login.dart';

abstract class LoginController {
  void login(
      GlobalKey<FormState> form,
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController,
      WidgetRef ref,
      );
}

class LoginControllerImpl implements LoginController {
  final LoginUseCase loginUseCase;

  LoginControllerImpl({required this.loginUseCase});

  @override
  login(
      GlobalKey<FormState> form,
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController,
      WidgetRef ref) {
    if (form.currentState?.validate() == true) {
      loginUseCase.call(
          email: emailController.text,
          password: passwordController.text,
          ref: ref,
          context: context);
      return;
    }
  }
}
