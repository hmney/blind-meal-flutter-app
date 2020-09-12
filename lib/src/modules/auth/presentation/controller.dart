import 'dart:async';

import 'package:app/src/core/utils.dart';
import 'package:app/src/modules/auth/domain/entities/user.dart';
import 'package:app/src/modules/auth/domain/repository/auth_repository.dart';
import 'package:app/src/modules/auth/domain/repository/user_repository.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:country_provider/country_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'package:mobx/mobx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'controller.g.dart';
part 'controller.freezed.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final authRepository = Modular.get<AuthRepository>();
  final userRepository = Modular.get<UserRepository>();
  final analytics = Modular.get<FirebaseAnalytics>();
  final loginScaffoldKey = GlobalKey<ScaffoldState>();
  final signupScaffoldKey = GlobalKey<ScaffoldState>();
  User user = User();
  String password;

  _AuthController() {
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

  @observable
  Country countryPhone;

  @observable
  Country countryResidence;

  @observable
  AuthState authState = AuthState.initial();

  @observable
  User currentUser;

  @action
  Future<void> addEvent(AuthEvent event) async {
    await event.when(
      appStarted: () async {
        try {
          //here we can load the neccessair data that we want with a splash screen
          await Future.delayed(Duration(seconds: 10));
          final firebaseUser = await authRepository.getCurrentUser();
          if (firebaseUser.uid == null) {
            authState = AuthState.unauthenticated();
          } else {
            currentUser = await userRepository.fetchUserData(firebaseUser.uid);
            if (currentUser == null) {
              await addEvent(AuthEvent.logout());
              return;
            }
            if (currentUser.isSurveyFilled)
              authState = AuthState.authenticated();
            else
              authState = AuthState.surveyNotFilled();
          }
        } catch (e) {
          authState = AuthState.unauthenticated();
          // await Crashlytics.instance.recordError(e, s);
        }
        await analytics.logAppOpen();
      },
      loggedIn: (uid) async {
        currentUser = await userRepository.fetchUserData(uid);
        if (currentUser == null) {
          await addEvent(AuthEvent.logout());
          return;
        }
        if (currentUser.isSurveyFilled)
          authState = AuthState.authenticated();
        else
          authState = AuthState.surveyNotFilled();
      },
      goHome: () async {
        authState = AuthState.authenticated();
      },
      logout: () async {
        await authRepository.signOut();
        authState = AuthState.loggedOut();
        currentUser = null;
        await analytics.logEvent(name: 'logout');
      },
    );
  }

  @action
  Future<void> authentication(AUTHENTICATION authentication) async {
    try {
      BotToast.showLoading();
      AuthResult authResult;
      if (authentication == AUTHENTICATION.SIGN_IN)
        authResult =
            await authRepository.signIn(email: user.email, password: password);
      if (authentication == AUTHENTICATION.SIGN_UP)
        authResult =
            await authRepository.signUp(email: user.email, password: password);
      if (authentication == AUTHENTICATION.GOOGLE_AUTH)
        authResult = await authRepository.signInWithGoogle();
      if (authResult != null && authResult.user.uid != null) {
        if (authentication == AUTHENTICATION.SIGN_UP) {
          user.id = authResult.user.uid;
          user.accountCreationTime = DateTime.now().toUtc();
          userRepository.createNewUserDataToFirebase(user);
          Modular.to.pop();
        }
        if (authentication == AUTHENTICATION.GOOGLE_AUTH) {
          user = User.createNewUser(
            id: authResult.user.uid,
            firstName: authResult.user.displayName,
            phone: authResult.user.phoneNumber,
            email: authResult.user.email,
            profilePicture: authResult.user.photoUrl,
          );
          if (authResult.additionalUserInfo.isNewUser) {
            userRepository.createNewUserDataToFirebase(user);
          }
        }
        await addEvent(AuthEvent.loggedIn(authResult.user.uid));
        BotToast.closeAllLoading();
      } else {
        BotToast.closeAllLoading();
      }
    } on PlatformException catch (error) {
      BotToast.closeAllLoading();
      var scaffoldKey;
      if (authentication == AUTHENTICATION.SIGN_IN)
        scaffoldKey = loginScaffoldKey;
      if (authentication == AUTHENTICATION.SIGN_UP)
        scaffoldKey = signupScaffoldKey;
      showSnackBarMsg(
          scaffoldKey.currentState, authRepository.handleException(error));
      FocusScope.of(loginScaffoldKey.currentContext).requestFocus(FocusNode());
    }
  }
}

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.appStarted() = AppStarted;
  const factory AuthEvent.loggedIn(String uid) = LoggedIn;
  const factory AuthEvent.goHome() = GoHome;
  const factory AuthEvent.logout() = Logout;
}

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.authenticated() = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.loggedOut() = LoggedOut;
  const factory AuthState.surveyNotFilled() = SurveyNotFilled;
}

enum AUTHENTICATION {
  SIGN_IN,
  SIGN_UP,
  GOOGLE_AUTH,
  FACEBOOK_AUTH,
}
