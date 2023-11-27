import 'package:flutter/material.dart';
import 'package:susten_app/src/core/enums/active_perfil_section.dart';
import 'package:susten_app/src/features/perfil/presentation/providers/active_perfil_section.dart';
import 'package:susten_app/src/features/perfil/presentation/widgets/perfil_menu_button.dart';

class PerfilMenu extends StatelessWidget {
  final BoxConstraints parentConstraints;
  final ActivePerfilSectionEnum perfilState;

  const PerfilMenu(
      {Key? key, required this.parentConstraints, required this.perfilState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: parentConstraints.maxWidth,
      height: parentConstraints.maxHeight * 0.07,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(parentConstraints.maxWidth * 0.03),
      ),
      child: LayoutBuilder(builder: (context, rowConstraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PerfilMenuButton(
              parentConstraints: rowConstraints,
              text: "Perfil",
              active: perfilState == ActivePerfilSectionEnum.PERFIL,
              value: ActivePerfilSectionEnum.PERFIL,
            ),
            PerfilMenuButton(
              parentConstraints: rowConstraints,
              text: "Estatísticas",
              active: perfilState == ActivePerfilSectionEnum.STATISTICS,
              value: ActivePerfilSectionEnum.STATISTICS,
            )
          ],
        );
      }),
    );
  }
}
