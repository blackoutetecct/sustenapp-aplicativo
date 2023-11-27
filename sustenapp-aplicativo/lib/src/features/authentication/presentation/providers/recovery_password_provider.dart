import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/enums/recovery_password_method.dart';

final recoveryPasswordMethodProvider = StateNotifierProvider<RecoveryPasswordMethodState, RecoveryPasswordMethod>(
  (ref) => RecoveryPasswordMethodState(),
);

class RecoveryPasswordMethodState extends StateNotifier<RecoveryPasswordMethod> {
  RecoveryPasswordMethodState() : super(RecoveryPasswordMethod.EMAIL);

  void setRecoveryMethod(RecoveryPasswordMethod option ) {
    state = option;
  }
  
}
