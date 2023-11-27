import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/features/authentication/data/repositories/authentication_repository.dart';
import 'package:susten_app/src/features/authentication/domain/usecases/check_user_authentication_status.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  final String sustenAppLogoPath = 'assets/images/susten-app-logo.png';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final useCase = CheckUserAuthenticationStatus(
      authenticationRepository: AuthenticationRepositoryImpl(),
      context: context,
      ref: ref,
    );
    useCase.call();

    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Image.asset(
              sustenAppLogoPath,
              semanticLabel: "Susten App Logo",
            ),
            PlatformCircularProgressIndicator(),
            Expanded(
              child: Container(),
            ),
            const Text(
              "Todos os Direitos Reservados - Blackout 2023",
              style: TextStyle(
                  color: Colors.white, fontSize: 14, fontFamily: 'Inter'),
            ),
            SizedBox(height: height * 0.01),
          ]),
      backgroundColor: primaryColor,
    );
  }
}
