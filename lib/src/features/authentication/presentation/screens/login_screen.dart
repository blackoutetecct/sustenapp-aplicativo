import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/utils/form_validator.dart';
import 'package:susten_app/src/core/utils/redirect.dart';
import 'package:susten_app/src/core/widgets/my_button.dart';
import 'package:susten_app/src/core/widgets/my_input.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/features/authentication/presentation/controllers/login_controller.dart';
import 'package:susten_app/src/features/authentication/presentation/providers/error_login.dart';
import 'package:susten_app/src/features/authentication/presentation/widgets/authentication_template.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key, required this.controller}) : super(key: key);

  final GlobalKey<FormState> globaFormKey = GlobalKey<FormState>();

  LoginController controller;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationTemplate(
          title: "LOGIN",
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
                          text: "Bem vindo de \nvolta!",
                          fontSize: 30,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: constraint.maxHeight * 0.09,
                      ),
                      Form(
                        key: globaFormKey,
                        child: Column(
                          children: [
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
                              label: "Digite sua senha",
                              prefixIcon: Icons.lock,
                              inputAction: TextInputAction.done,
                              inputType: TextInputType.text,
                              isPassword: true,
                              validator: FormValidator.validateEmptyField,
                              controller: passwordController,
                            ),
                            Consumer(builder: (context, ref, _) {
                              final error = ref.watch(errorProvider);

                              return Visibility(
                                  visible: error.isNotEmpty,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      error,
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  ));
                            }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraint.maxHeight * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          redirectToPage('/password_recovery_options', context);
                        },
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: MyText(
                            text: "Esqueci minha senha?",
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: redColor,
                            alignment: TextAlign.right,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Consumer(
                        builder: (_, ref, ___) {
                          return MyButton(
                              text: "LOGIN",
                              onTap: () {
                                controller.login(globaFormKey, context,
                                    emailController, passwordController, ref);
                              });
                        },
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const MyText(
                              text: "Você não tem conta  ainda?",
                              color: darkGray,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                            SizedBox(
                              child: GestureDetector(
                                onTap: () {
                                  redirectToPage('/register', context);
                                },
                                child: const MyText(
                                  text: " Cadastre-se",
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
