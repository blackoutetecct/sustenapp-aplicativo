import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/enums/active_perfil_section.dart';
import 'package:susten_app/src/core/widgets/tab_screens_template.dart';
import 'package:susten_app/src/features/perfil/presentation/providers/active_perfil_section.dart';
import 'package:susten_app/src/features/perfil/presentation/widgets/perfil_section.dart';
import 'package:susten_app/src/features/perfil/presentation/widgets/statistcs_section.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // Estado para definir a tela 
    final perfilState = ref.watch(ActivePerfilSectionProvider);

    return TabScreensTemplate(
      title: "PERFIL",
      includesBackButton: true,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.only(
              top: constraints.maxHeight * 0.03,
              left: constraints.maxWidth * 0.025,
              right: constraints.maxWidth * 0.025,
            ),
            child: perfilState == ActivePerfilSectionEnum.PERFIL
                ? PerfilSection(
                    parentConstraints: constraints,
                    perfilState: perfilState,
                  )
                : StatisticsSection(
                    parentConstraints: constraints,
                    perfilState: perfilState,
                  ),
          );
        },
      ),
    );
  }
}
