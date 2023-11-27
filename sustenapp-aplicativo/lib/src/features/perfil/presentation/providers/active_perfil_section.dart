import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/enums/active_perfil_section.dart';

final ActivePerfilSectionProvider =
    StateNotifierProvider<ActivePerfilSection, ActivePerfilSectionEnum>(
        (ref) => ActivePerfilSection());

class ActivePerfilSection extends StateNotifier<ActivePerfilSectionEnum> {
  ActivePerfilSection() : super(ActivePerfilSectionEnum.PERFIL);

  setActiveSection(ActivePerfilSectionEnum section){
    state = section;
  }

}
