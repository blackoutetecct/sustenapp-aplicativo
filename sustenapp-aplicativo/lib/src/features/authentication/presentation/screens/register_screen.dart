import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/utils/form_validator.dart';
import 'package:susten_app/src/core/utils/redirect.dart';
import 'package:susten_app/src/core/widgets/my_button.dart';
import 'package:susten_app/src/core/widgets/my_input.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/features/authentication/presentation/controllers/register_controller.dart';
import 'package:susten_app/src/features/authentication/presentation/providers/register_error.dart';
import 'package:susten_app/src/features/authentication/presentation/widgets/authentication_template.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController controller;

  RegisterScreen({Key? key, required this.controller}) : super(key: key);

  final GlobalKey<FormState> globaFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationTemplate(
          title: "CADASTRE-SE",
          child: LayoutBuilder(builder: (context, constraint) {
            return SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(children: <Widget>[
                      const Align(
                        alignment: Alignment.topLeft,
                        child: MyText(
                          text: "Bem vindo!",
                          fontSize: 30,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                          text: "Olá, inscreva-se para continuar",
                          color: darkGray,
                          fontSize: 18,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: constraint.maxHeight * 0.04,
                      ),
                      Form(
                        key: globaFormKey,
                        child: Column(
                          children: [
                            MyInput(
                              label: "Digite seu nome",
                              prefixIcon: Icons.account_box,
                              inputType: TextInputType.name,
                              validator: FormValidator.validateNameField,
                              controller: nameController,
                            ),
                            SizedBox(
                              height: constraint.maxHeight * 0.04,
                            ),
                            MyInput(
                              label: "Digite seu email",
                              prefixIcon: Icons.attach_email,
                              inputType: TextInputType.emailAddress,
                              validator: FormValidator.validateEmailField,
                              controller: emailController,
                            ),
                            SizedBox(
                              height: constraint.maxHeight * 0.04,
                            ),
                            MyInput(
                              label: "Digite seu CPF",
                              prefixIcon: Icons.badge,
                              inputType: TextInputType.number,
                              validator: FormValidator.validateCPF,
                              controller: cpfController,
                            ),
                            SizedBox(
                              height: constraint.maxHeight * 0.04,
                            ),
                            MyInput(
                              label: "Digite sua senha",
                              prefixIcon: Icons.lock,
                              inputAction: TextInputAction.done,
                              inputType: TextInputType.text,
                              isPassword: true,
                              validator: FormValidator.validatePasswordField,
                              controller: passwordController,
                            ),
                            SizedBox(
                              height: constraint.maxHeight * 0.04,
                            ),
                            Consumer(builder: (context, ref, _) {
                              final error = ref.watch(registerError);

                              return Visibility(
                                  visible: error.isNotEmpty,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      error,
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  ));
                            })
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraint.maxHeight * 0.01,
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Consumer(builder: (context, ref, _) {
                        return MyButton(
                            text: "CADASTRAR",
                            onTap: () {
                              controller.register(
                                globaFormKey,
                                nameController,
                                emailController,
                                cpfController,
                                passwordController,
                                ref,
                                context,
                              );
                            });
                      }),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const MyText(
                              text: "Você já tem conta?",
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
                        height: constraint.maxHeight * 0.02,
                      ),
                    ]),
                  ),
                ),
              ),
            );
          })),
    );
  }
}
