import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/enums/recovery_password_method.dart';
import 'package:susten_app/src/features/authentication/presentation/providers/recovery_password_provider.dart';

abstract class PasswordRecoveryOptionController {
  void setRecoveryMethod(RecoveryPasswordMethod value, WidgetRef ref);
}

class PasswordRecoveryOptionControllerImpl
    extends PasswordRecoveryOptionController {
  @override
  void setRecoveryMethod(RecoveryPasswordMethod value, WidgetRef ref) {
    final selectedMethod = ref.read(recoveryPasswordMethodProvider.notifier);
    selectedMethod.state = value;
  }
}
