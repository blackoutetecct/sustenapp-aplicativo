import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/enums/recovery_password_method.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/utils/form_validator.dart';
import 'package:susten_app/src/core/utils/redirect.dart';
import 'package:susten_app/src/core/widgets/my_button.dart';
import 'package:susten_app/src/core/widgets/my_input.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/features/authentication/presentation/providers/recovery_password_provider.dart';
import 'package:susten_app/src/features/authentication/presentation/widgets/authentication_template.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationTemplate(
        title: "REDEFINIR SENHA ",
        child: LayoutBuilder(builder: (context, constraints) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Consumer(builder: (context, ref, child) {
              final state = ref.read(recoveryPasswordMethodProvider);
              final String text = state == RecoveryPasswordMethod.EMAIL
                  ? "email"
                  : 'numero de celular';
              final String label = state == RecoveryPasswordMethod.EMAIL
              ? "Digite seu email"
              : '11 00000-0000';
              final TextInputType inputType =
                  state == RecoveryPasswordMethod.EMAIL
                      ? TextInputType.emailAddress
                      : TextInputType.phone;
              dynamic Function(String?)? validator =
                  state == RecoveryPasswordMethod.EMAIL
                      ? FormValidator.validateEmailField
                      : FormValidator.validatePhoneNumber;
              IconData prefixIcon = state == RecoveryPasswordMethod.EMAIL
                  ? Icons.attach_email
                  : Icons.phone_callback;
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
                  SizedBox(
                    height: constraints.maxHeight * 0.07,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Informe o $text para o qual deseja redefinir a sua senha",
                      style: const TextStyle(
                          color: darkGray,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.055,
                  ),
                  MyInput(
                    label: label,
                    inputType: inputType,
                    prefixIcon: prefixIcon,
                    validator: validator,
                    inputAction: TextInputAction.done,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  MyButton(text: "CONFIRMAR", onTap: () {}),
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
          );
        }),
      ),
    );
  }
}
