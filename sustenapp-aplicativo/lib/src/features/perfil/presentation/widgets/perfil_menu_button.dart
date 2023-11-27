import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/enums/active_perfil_section.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/features/perfil/presentation/providers/active_perfil_section.dart';

class PerfilMenuButton extends ConsumerWidget {
  final BoxConstraints parentConstraints;
  final ActivePerfilSectionEnum value;
  final String text;
  final bool active;

  const PerfilMenuButton({
    Key? key,
    required this.value,
    required this.parentConstraints,
    required this.text,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final perfilState = ref.read(ActivePerfilSectionProvider.notifier);
    return Container(
      width: parentConstraints.maxWidth * 0.48,
      height: parentConstraints.maxHeight * 0.86,
      decoration: BoxDecoration(
        color: active ? const Color(0xFFF5F5F5) : Colors.transparent,
        borderRadius: BorderRadius.circular(parentConstraints.maxWidth * 0.02),
      ),
      child: Center(
        child: TextButton(
            onPressed: () {
              perfilState.setActiveSection(value);
            },
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                color: darkBrawn,
              ),
            )),
      ),
    );
  }
}
