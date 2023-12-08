import 'package:flutter/material.dart';
import 'package:susten_app/src/core/enums/recovery_password_method.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/utils/redirect.dart';
import 'package:susten_app/src/core/widgets/my_button.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/features/authentication/presentation/controllers/password_recovery_options_controller.dart';
import 'package:susten_app/src/features/authentication/presentation/widgets/authentication_template.dart';
import 'package:susten_app/src/features/authentication/presentation/widgets/password_recovery_option.dart';

class PasswordRecoveryOptions extends StatelessWidget {
  final PasswordRecoveryOptionController controller;

  const PasswordRecoveryOptions({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationTemplate(
        title: "REDEFINIR SENHA ",
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Esqueci senha",
                  fontSize: 30,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                  alignment: TextAlign.left,
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Selecione a opção para enviar a senha de redefinição",
                  style: TextStyle(
                      color: darkGray,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              PasswordRecoveryOption(
                containerHeight: constraints.maxHeight,
                icon: Icons.attach_email,
                text: 'Redefinir por Email',
                value: RecoveryPasswordMethod.EMAIL,
                onTap: controller.setRecoveryMethod
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              PasswordRecoveryOption(
                containerHeight: constraints.maxHeight,
                icon: Icons.phone_callback,
                text: 'Redefinir por SMS',
                value: RecoveryPasswordMethod.SMS,
                onTap: controller.setRecoveryMethod

              ),
              Expanded(
                child: Container(),
              ),
              MyButton(text: "CONFIRMAR", onTap: () {
                redirectToPage('/password_recovery', context);
              }),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const MyText(
                      text: "Você já tem uma conta?",
                      color: darkGray,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    SizedBox(
                      child: GestureDetector(
                        onTap: () {
                          redirectToPage('/login', context);
                        },
                        child: const MyText(
                          text: " Login",
                          color: primaryColor,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
            ],
          );
        }),
      ),
    );
  }
}
