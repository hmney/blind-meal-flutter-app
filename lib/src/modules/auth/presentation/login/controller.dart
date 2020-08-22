import 'package:app/src/core/utils.dart';
import 'package:app/src/modules/auth/domain/entities/user.dart';
import 'package:app/src/modules/auth/domain/repository/auth_repository.dart';
import 'package:app/src/modules/auth/domain/repository/user_repository.dart';
import 'package:app/src/modules/auth/module.dart';
import 'package:app/src/modules/auth/presentation/auth/controller.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final userRepository = Modular.get<UserRepository>();
  final authRepository = Modular.get<AuthRepository>();
  final authController = Modular.get<AuthController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  User user = User();
  String password;
  Future<void> signIn() async {
    BotToast.showLoading();
    try {
      var authResult =
          await authRepository.signIn(email: user.email, password: password);
      if (authResult != null) {
        authController.addEvent(AuthEvent.loggedIn(authResult.user.uid));
        BotToast.closeAllLoading();
        await AuthModule.toHomeScreen();
      }
    } on PlatformException catch (error) {
      BotToast.closeAllLoading();

      showSnackBarMsg(
          scaffoldKey.currentState, authRepository.handleException(error));
      FocusScope.of(scaffoldKey.currentContext).requestFocus(FocusNode());
      // await Crashlytics.instance.recordError(error.code, s);
    }
  }
}
