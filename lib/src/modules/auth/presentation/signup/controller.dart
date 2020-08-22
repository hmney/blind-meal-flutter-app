import 'package:app/src/core/utils.dart';
import 'package:app/src/modules/auth/domain/entities/user.dart';
import 'package:app/src/modules/auth/domain/repository/auth_repository.dart';
import 'package:app/src/modules/auth/domain/repository/user_repository.dart';
import 'package:app/src/modules/auth/module.dart';
import 'package:app/src/modules/auth/presentation/auth/controller.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:country_provider/country_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class SignupController = _SignupController with _$SignupController;

abstract class _SignupController with Store {
  final userRepository = Modular.get<UserRepository>();
  final authRepository = Modular.get<AuthRepository>();
  final authController = Modular.get<AuthController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  User user = User();
  String password;
  @observable
  Country countryPhone;

  @observable
  Country countryResidence;

  _SignupController() {
    init();
  }

  void init() async {
    try {
      final code = await FlutterSimCountryCode.simCountryCode;
      countryPhone = await CountryProvider.getCountryByCode(code);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signUp() async {
    BotToast.showLoading();
    try {
      final authResult = await authRepository.signUp(
        email: user.email,
        password: password,
      );
      if (authResult.user.uid != null) {
        user.id = authResult.user.uid;
        user.accountCreationTime = DateTime.now().toUtc();
        userRepository.createNewUserDataToFirebase(user);
        authController.addEvent(AuthEvent.loggedIn(authResult.user.uid));
        BotToast.closeAllLoading();
        await AuthModule.toHomeScreen();
      }
    } on PlatformException catch (error) {
      BotToast.closeAllLoading();
      showSnackBarMsg(
          scaffoldKey.currentState, authRepository.handleException(error));
      FocusScope.of(scaffoldKey.currentContext).requestFocus(FocusNode());
      // await Crashlytics.instance.recordError(error, s);
    }
  }
}
