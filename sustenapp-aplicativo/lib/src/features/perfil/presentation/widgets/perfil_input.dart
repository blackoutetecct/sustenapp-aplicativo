import 'package:flutter/material.dart';
import 'package:susten_app/src/core/theme/theme.dart';

class PerfilInput extends StatelessWidget {
  final BoxConstraints widthConstraints;
  final BoxConstraints heightConstraints;
  final String value;
  final String label;
  final bool? halfWidth;

  const PerfilInput({
    Key? key,
    required this.widthConstraints,
    required this.heightConstraints,
    required this.value,
    required this.label,
    this.halfWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController.fromValue(TextEditingValue(text: value));

    return Container(
      width: halfWidth == true
          ? widthConstraints.maxWidth * 0.5
          : widthConstraints.maxWidth,
      height: heightConstraints.maxHeight * 0.11,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Positioned(
            bottom: 4,
            left: 4,
            child: SizedBox(
              height: heightConstraints.maxHeight * 0.09,
              width: halfWidth == true
                  ? widthConstraints.maxWidth * 0.48
                  : widthConstraints.maxWidth * 0.908,
              child: TextField(
                controller: controller,
                enabled: false,
                readOnly: true,
                style: const TextStyle(
                    fontSize: 15,
                    color: darkBrawn,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFFB4B4B4),
                    ),
                    borderRadius:
                        BorderRadius.circular(widthConstraints.maxWidth * 0.03),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -3,
            left: 20,
            child: Text(
              "\u00A0\u00A0\u00A0$label\u00A0\u00A0\u00A0",
              style: const TextStyle(
                fontSize: 15,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
                color: primaryColor,
                backgroundColor: secondaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
