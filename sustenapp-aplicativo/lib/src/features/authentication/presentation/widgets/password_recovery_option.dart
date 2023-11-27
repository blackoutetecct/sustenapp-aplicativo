import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/enums/recovery_password_method.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/features/authentication/presentation/providers/recovery_password_provider.dart';

class PasswordRecoveryOption extends ConsumerWidget {
  final double containerHeight;
  final String text;
  final IconData icon;
  final RecoveryPasswordMethod value;
  final Function(RecoveryPasswordMethod value, WidgetRef ref) onTap;

  const PasswordRecoveryOption({
    Key? key,
    required this.containerHeight,
    required this.text,
    required this.icon,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, watch, child) {
      final selectedMethod = watch.watch(recoveryPasswordMethodProvider);
      return GestureDetector(
        onTap: () {
          onTap(value, ref);
        },
        child: Container(
          width: double.infinity,
          height: containerHeight * 0.18,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.2),
                offset: const Offset(0, 25),
                blurRadius: 25,
                spreadRadius: 2,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Stack(
            children: [
              Visibility(
                visible: value == selectedMethod,
                child: Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: const Icon(Icons.check, color: Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        color: Color(0xfff6f2cf),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Icon(icon, color: primaryColor),
                    ),
                    const SizedBox(width: 15),
                    MyText(
                      text: text,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontFamily: 'Lexend',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
