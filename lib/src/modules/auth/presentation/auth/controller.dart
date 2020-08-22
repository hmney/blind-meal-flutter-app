import 'package:app/src/modules/auth/domain/entities/user.dart';
import 'package:app/src/modules/auth/domain/repository/auth_repository.dart';
import 'package:app/src/modules/auth/domain/repository/user_repository.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'controller.g.dart';
part 'controller.freezed.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final authRepo = Modular.get<AuthRepository>();
  final userRepo = Modular.get<UserRepository>();
  final analytics = Modular.get<FirebaseAnalytics>();

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
          final firebaseUser = await authRepo.getCurrentUser();
          if (firebaseUser.uid == null) {
            authState = AuthState.unauthenticated();
          } else {
            authState = AuthState.authenticated();
          }
        } catch (e) {
          authState = AuthState.unauthenticated();
        }
        await analytics.logAppOpen();
      },
      loggedIn: (uid) async {
        authState = AuthState.authenticated();
      },
      logout: () async {
        await authRepo.signOut();
        authState = AuthState.loggedOut();
        await analytics.logEvent(name: 'logout');
      },
    );
  }
}

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.appStarted() = AppStarted;
  const factory AuthEvent.loggedIn(String uid) = LoggedIn;
  const factory AuthEvent.logout() = Logout;
}

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.authenticated() = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.loggedOut() = LoggedOut;
}
