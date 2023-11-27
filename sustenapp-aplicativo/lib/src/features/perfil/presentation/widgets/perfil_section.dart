import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/enums/active_perfil_section.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/features/authentication/presentation/providers/user_data.dart';
import 'package:susten_app/src/features/perfil/presentation/widgets/perfil_image.dart';
import 'package:susten_app/src/features/perfil/presentation/widgets/perfil_input.dart';
import 'package:susten_app/src/features/perfil/presentation/widgets/perfil_menu.dart';

class PerfilSection extends StatelessWidget {
  final BoxConstraints parentConstraints;
  final ActivePerfilSectionEnum perfilState;

  const PerfilSection(
      {Key? key, required this.parentConstraints, required this.perfilState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PerfilMenu(
          parentConstraints: parentConstraints,
          perfilState: perfilState,
        ),
        SizedBox(
          height: parentConstraints.maxHeight * 0.03,
        ),
        PerfilImage(parentConstraints: parentConstraints),
        SizedBox(
          height: parentConstraints.maxHeight * 0.03,
        ),
        Consumer(builder: (context, ref, _) {
          final userName = ref.watch(userNameProvider);
          return PerfilInput(
            widthConstraints: parentConstraints,
            heightConstraints: parentConstraints,
            label: "Nome",
            value: userName,
          );
        }),
        Consumer(builder: (context, ref, _) {
          final userEmail = ref.watch(userEmailProvider);
          return PerfilInput(
            widthConstraints: parentConstraints,
            heightConstraints: parentConstraints,
            label: "E-mail",
            value: userEmail,
          );
        }),
        SizedBox(
          height: parentConstraints.maxHeight * 0.015,
        ),
        const MyText(
          text: "DADOS PESSOAIS",
          fontSize: 18,
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
        SizedBox(
          height: parentConstraints.maxHeight * 0.015,
        ),
        Expanded(
          child: LayoutBuilder(builder: (context, inputsConstraints) {
            return Column(
              children: [
                Row(
                  children: [
                    PerfilInput(
                      widthConstraints: inputsConstraints,
                      heightConstraints: parentConstraints,
                      label: "Senha",
                      value: "*****",
                      halfWidth: true,
                    ),
                    Container(
                      width: inputsConstraints.maxWidth * 0.475,
                      height: parentConstraints.maxWidth * 0.13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            parentConstraints.maxWidth * 0.11),
                        border: Border.all(
                          color: const Color(0xFFB4B4B4),
                          width: 2,
                        ),
                      ),
                      child: const MyText(
                        text: "ALTERAR SENHA",
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    PerfilInput(
                      widthConstraints: inputsConstraints,
                      heightConstraints: parentConstraints,
                      label: "Celular",
                      value: "(11) 93447-3017",
                      halfWidth: true,
                    ),
                    PerfilInput(
                      widthConstraints: inputsConstraints,
                      heightConstraints: parentConstraints,
                      label: "Endereço",
                      value: "Itaquera",
                      halfWidth: true,
                    ),
                  ],
                ),
                Row(
                  children: [
                    PerfilInput(
                      widthConstraints: inputsConstraints,
                      heightConstraints: parentConstraints,
                      label: "Nascimento",
                      value: "29/06/2005",
                      halfWidth: true,
                    ),
                    PerfilInput(
                      widthConstraints: inputsConstraints,
                      heightConstraints: parentConstraints,
                      label: "CPF",
                      value: "111 111 111-11",
                      halfWidth: true,
                    ),
                  ],
                )
              ],
            );
          }),
        )
      ],
    );
  }
}
