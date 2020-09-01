// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthController, Store {
  final _$countryPhoneAtom = Atom(name: '_AuthController.countryPhone');

  @override
  Country get countryPhone {
    _$countryPhoneAtom.reportRead();
    return super.countryPhone;
  }

  @override
  set countryPhone(Country value) {
    _$countryPhoneAtom.reportWrite(value, super.countryPhone, () {
      super.countryPhone = value;
    });
  }

  final _$countryResidenceAtom = Atom(name: '_AuthController.countryResidence');

  @override
  Country get countryResidence {
    _$countryResidenceAtom.reportRead();
    return super.countryResidence;
  }

  @override
  set countryResidence(Country value) {
    _$countryResidenceAtom.reportWrite(value, super.countryResidence, () {
      super.countryResidence = value;
    });
  }

  final _$authStateAtom = Atom(name: '_AuthController.authState');

  @override
  AuthState get authState {
    _$authStateAtom.reportRead();
    return super.authState;
  }

  @override
  set authState(AuthState value) {
    _$authStateAtom.reportWrite(value, super.authState, () {
      super.authState = value;
    });
  }

  final _$currentUserAtom = Atom(name: '_AuthController.currentUser');

  @override
  User get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$addEventAsyncAction = AsyncAction('_AuthController.addEvent');

  @override
  Future<void> addEvent(AuthEvent event) {
    return _$addEventAsyncAction.run(() => super.addEvent(event));
  }

  final _$authenticationAsyncAction =
      AsyncAction('_AuthController.authentication');

  @override
  Future<void> authentication(AUTHENTICATION authentication) {
    return _$authenticationAsyncAction
        .run(() => super.authentication(authentication));
  }

  @override
  String toString() {
    return '''
countryPhone: ${countryPhone},
countryResidence: ${countryResidence},
authState: ${authState},
currentUser: ${currentUser}
    ''';
  }
}
