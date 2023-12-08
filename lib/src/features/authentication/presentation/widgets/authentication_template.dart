import 'package:flutter/material.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/utils/redirect.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';

class AuthenticationTemplate extends StatelessWidget {
  final Widget child;
  final String title;

  const AuthenticationTemplate(
      {Key? key, required this.child, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          color: primaryColor,
          child: Column(
            children: [
              SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.26,
                child: Stack(
                  children: [
                    Positioned(
                      top: -0,
                      right: -constraints.maxWidth * 0.1,
                      child: Image.asset(
                        "assets/images/bubbles-right.png",
                        height: constraints.maxHeight * 0.2,
                        width: constraints.maxWidth * 0.5,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned(
                      top: constraints.maxHeight * 0.07,
                      left: constraints.maxWidth * 0.08,
                      child: GestureDetector(
                        onTap: () {
                          redirectToPreviousPage(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: constraints.maxHeight * 0.175,
                      left: constraints.maxWidth * 0.08,
                      child: MyText(
                        text: title,
                        color: Colors.white,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    width: constraints.maxWidth,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(35),
                      ),
                    ),
                    child: LayoutBuilder(builder: (context, mainConstraint) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 25,
                          right: 25,
                          top: mainConstraint.maxHeight * 0.07,
                        ),
                        child: child,
                      );
                    })),
              )
            ],
          ),
        );
      },
    );
  }
}
