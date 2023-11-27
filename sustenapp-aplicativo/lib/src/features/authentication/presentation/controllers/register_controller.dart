import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/features/authentication/domain/usecases/register.dart';

abstract class RegisterController {
  void register(
    GlobalKey<FormState> form,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController cpfController,
    TextEditingController passwordController,
    WidgetRef ref,
    BuildContext context,
  );
}

class RegisterControllerImpl implements RegisterController {
  final RegisterUseCase registerUseCase;

  RegisterControllerImpl({required this.registerUseCase});

  @override
  register(
    GlobalKey<FormState> form,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController cpfController,
    TextEditingController passwordController,
    WidgetRef ref,
    BuildContext context,
  ) {
    if (form.currentState?.validate() == true) {
      registerUseCase.call(
        nameController: nameController,
        emailController: emailController,
        cpfController: cpfController,
        passwordController: passwordController,
        ref: ref,
        context: context,
      );
    }
  }
}
