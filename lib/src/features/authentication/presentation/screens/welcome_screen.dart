import 'package:flutter/material.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/utils/redirect.dart';
import 'package:susten_app/src/core/widgets/my_button.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/features/authentication/presentation/widgets/social_login_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final homeImageAssetPath = "assets/images/welcome_home.png";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryColor,
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height:
                  constraints.maxHeight > 640.0 ? height * 0.08 : height * 0.06,
            ),
            Center(
              child: Image.asset(homeImageAssetPath, height: height * 0.45),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: "BEM VINDO",
                        fontSize: 30,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: "Gerencie suas despesas",
                        fontSize: 20,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: "sustentabilidade  &  intuitividade",
                        fontSize: 22,
                        fontFamily: 'Merriweather Sans',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                     SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                    const SocialLoginButton(),
                    const SizedBox(
                      height: 15,
                    ),
                    MyButton(
                      text: 'Criar minha conta',
                      border: true,
                       onTap: () {
                        redirectToPage('/register',context);
                       }
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const MyText(
                          text: "Já possui uma conta?",
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              redirectToPage('/login', context);
                            },
                            child: const MyText(
                              text: " Login",
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
