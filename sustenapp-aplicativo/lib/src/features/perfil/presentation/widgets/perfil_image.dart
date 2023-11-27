import 'package:flutter/material.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';

class PerfilImage extends StatelessWidget {
  final BoxConstraints parentConstraints;

  const PerfilImage({Key? key, required this.parentConstraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: parentConstraints.maxWidth * 0.35,
            height: parentConstraints.maxHeight * 0.2,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Hero(
              tag: 'userPic',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  parentConstraints.maxWidth * 0.05,
                ),
                child: Image.asset(
                  "assets/images/user.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: parentConstraints.maxWidth * 0.07,
          ),
          Container(
            width: parentConstraints.maxWidth * 0.45,
            height: parentConstraints.maxHeight * 0.09,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(parentConstraints.maxWidth * 0.1),
              border: Border.all(
                color: const Color(0xFFB4B4B4),
                width: 2,
              ),
            ),
            child: const MyText(
              text: "ALTERAR FOTO",
              fontSize: 14,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
