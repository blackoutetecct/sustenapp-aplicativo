import 'package:flutter/material.dart';
import 'package:susten_app/src/core/theme/theme.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonSize = screenHeight * 0.070;

    final fontSize = screenWidth *
        0.040;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: ElevatedButton.icon(
        icon: Image.asset('assets/images/google.png'),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(buttonSize),
            backgroundColor: Colors.white,
            foregroundColor: primaryColor,
            textStyle: TextStyle(
              fontSize: fontSize,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w700,
              
            )),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text("Efetuar login com Google"),
        ),
      ),
    );
  }
}
