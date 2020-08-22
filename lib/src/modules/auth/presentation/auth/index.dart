import 'package:app/src/modules/app/presentation/home.dart';
import 'package:app/src/modules/auth/presentation/auth/controller.dart';
import 'package:app/src/modules/auth/presentation/login/index.dart';
import 'package:app/src/modules/auth/presentation/onboarding/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends ModularState<AuthScreen, AuthController> {
  @override
  void initState() {
    super.initState();
    controller.addEvent(AuthEvent.appStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => controller.authState.when<Widget>(
        initial: () => Container(),
        authenticated: () => HomeScreen(),
        unauthenticated: () => OnboardingScreens(),
        loggedOut: () => LoginScreen(),
      ),
    );
  }
}
