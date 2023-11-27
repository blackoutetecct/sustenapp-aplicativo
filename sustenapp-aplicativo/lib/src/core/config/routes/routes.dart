import 'package:flutter/material.dart';
import 'package:susten_app/src/core/config/routes/tab_routes.dart';
import 'package:susten_app/src/features/authentication/data/repositories/authentication_repository.dart';
import 'package:susten_app/src/features/authentication/domain/usecases/login.dart';
import 'package:susten_app/src/features/authentication/domain/usecases/register.dart';
import 'package:susten_app/src/features/authentication/presentation/controllers/login_controller.dart';
import 'package:susten_app/src/features/authentication/presentation/controllers/password_recovery_options_controller.dart';
import 'package:susten_app/src/features/authentication/presentation/controllers/register_controller.dart';
import 'package:susten_app/src/features/authentication/presentation/screens/loading_screen.dart';
import 'package:susten_app/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:susten_app/src/features/authentication/presentation/screens/password_recovery_options_screen.dart';
import 'package:susten_app/src/features/authentication/presentation/screens/password_recovery_screen.dart';
import 'package:susten_app/src/features/authentication/presentation/screens/register_screen.dart';
import 'package:susten_app/src/features/authentication/presentation/screens/welcome_screen.dart';
import 'package:susten_app/src/features/consumption/presentation/screens/room_detail.dart';

final Map<String, Widget Function(BuildContext)> routes =
    <String, Widget Function(BuildContext)>{
  "/loading": (_) => const LoadingScreen(),
  "/login": (_) => LoginScreen(
      controller: LoginControllerImpl(
          loginUseCase: LoginUseCase(
              authenticationRepo: AuthenticationRepositoryImpl()))),
  "/register": (_) => RegisterScreen(
      controller: RegisterControllerImpl(
          registerUseCase: RegisterUseCase(
              authenticationRepo: AuthenticationRepositoryImpl()))),
  "/welcome": (_) => const WelcomeScreen(),
  "/password_recovery_options": (_) => PasswordRecoveryOptions(
      controller: PasswordRecoveryOptionControllerImpl()),
  "/password_recovery": (_) => const PasswordRecovery(),
  "/tab_routes": (_) => const TabRoutes(),
  "/room_detail": (_) => const RoomDetail()
};
