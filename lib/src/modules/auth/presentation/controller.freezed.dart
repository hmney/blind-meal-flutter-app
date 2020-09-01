// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthEventTearOff {
  const _$AuthEventTearOff();

// ignore: unused_element
  AppStarted appStarted() {
    return const AppStarted();
  }

// ignore: unused_element
  LoggedIn loggedIn(String uid) {
    return LoggedIn(
      uid,
    );
  }

// ignore: unused_element
  GoHome goHome() {
    return const GoHome();
  }

// ignore: unused_element
  Logout logout() {
    return const Logout();
  }
}

// ignore: unused_element
const $AuthEvent = _$AuthEventTearOff();

mixin _$AuthEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result appStarted(),
    @required Result loggedIn(String uid),
    @required Result goHome(),
    @required Result logout(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result appStarted(),
    Result loggedIn(String uid),
    Result goHome(),
    Result logout(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result appStarted(AppStarted value),
    @required Result loggedIn(LoggedIn value),
    @required Result goHome(GoHome value),
    @required Result logout(Logout value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result appStarted(AppStarted value),
    Result loggedIn(LoggedIn value),
    Result goHome(GoHome value),
    Result logout(Logout value),
    @required Result orElse(),
  });
}

abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

abstract class $AppStartedCopyWith<$Res> {
  factory $AppStartedCopyWith(
          AppStarted value, $Res Function(AppStarted) then) =
      _$AppStartedCopyWithImpl<$Res>;
}

class _$AppStartedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AppStartedCopyWith<$Res> {
  _$AppStartedCopyWithImpl(AppStarted _value, $Res Function(AppStarted) _then)
      : super(_value, (v) => _then(v as AppStarted));

  @override
  AppStarted get _value => super._value as AppStarted;
}

class _$AppStarted implements AppStarted {
  const _$AppStarted();

  @override
  String toString() {
    return 'AuthEvent.appStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AppStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result appStarted(),
    @required Result loggedIn(String uid),
    @required Result goHome(),
    @required Result logout(),
  }) {
    assert(appStarted != null);
    assert(loggedIn != null);
    assert(goHome != null);
    assert(logout != null);
    return appStarted();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result appStarted(),
    Result loggedIn(String uid),
    Result goHome(),
    Result logout(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (appStarted != null) {
      return appStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result appStarted(AppStarted value),
    @required Result loggedIn(LoggedIn value),
    @required Result goHome(GoHome value),
    @required Result logout(Logout value),
  }) {
    assert(appStarted != null);
    assert(loggedIn != null);
    assert(goHome != null);
    assert(logout != null);
    return appStarted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result appStarted(AppStarted value),
    Result loggedIn(LoggedIn value),
    Result goHome(GoHome value),
    Result logout(Logout value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (appStarted != null) {
      return appStarted(this);
    }
    return orElse();
  }
}

abstract class AppStarted implements AuthEvent {
  const factory AppStarted() = _$AppStarted;
}

abstract class $LoggedInCopyWith<$Res> {
  factory $LoggedInCopyWith(LoggedIn value, $Res Function(LoggedIn) then) =
      _$LoggedInCopyWithImpl<$Res>;
  $Res call({String uid});
}

class _$LoggedInCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $LoggedInCopyWith<$Res> {
  _$LoggedInCopyWithImpl(LoggedIn _value, $Res Function(LoggedIn) _then)
      : super(_value, (v) => _then(v as LoggedIn));

  @override
  LoggedIn get _value => super._value as LoggedIn;

  @override
  $Res call({
    Object uid = freezed,
  }) {
    return _then(LoggedIn(
      uid == freezed ? _value.uid : uid as String,
    ));
  }
}

class _$LoggedIn implements LoggedIn {
  const _$LoggedIn(this.uid) : assert(uid != null);

  @override
  final String uid;

  @override
  String toString() {
    return 'AuthEvent.loggedIn(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoggedIn &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(uid);

  @override
  $LoggedInCopyWith<LoggedIn> get copyWith =>
      _$LoggedInCopyWithImpl<LoggedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result appStarted(),
    @required Result loggedIn(String uid),
    @required Result goHome(),
    @required Result logout(),
  }) {
    assert(appStarted != null);
    assert(loggedIn != null);
    assert(goHome != null);
    assert(logout != null);
    return loggedIn(uid);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result appStarted(),
    Result loggedIn(String uid),
    Result goHome(),
    Result logout(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loggedIn != null) {
      return loggedIn(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result appStarted(AppStarted value),
    @required Result loggedIn(LoggedIn value),
    @required Result goHome(GoHome value),
    @required Result logout(Logout value),
  }) {
    assert(appStarted != null);
    assert(loggedIn != null);
    assert(goHome != null);
    assert(logout != null);
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result appStarted(AppStarted value),
    Result loggedIn(LoggedIn value),
    Result goHome(GoHome value),
    Result logout(Logout value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class LoggedIn implements AuthEvent {
  const factory LoggedIn(String uid) = _$LoggedIn;

  String get uid;
  $LoggedInCopyWith<LoggedIn> get copyWith;
}

abstract class $GoHomeCopyWith<$Res> {
  factory $GoHomeCopyWith(GoHome value, $Res Function(GoHome) then) =
      _$GoHomeCopyWithImpl<$Res>;
}

class _$GoHomeCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $GoHomeCopyWith<$Res> {
  _$GoHomeCopyWithImpl(GoHome _value, $Res Function(GoHome) _then)
      : super(_value, (v) => _then(v as GoHome));

  @override
  GoHome get _value => super._value as GoHome;
}

class _$GoHome implements GoHome {
  const _$GoHome();

  @override
  String toString() {
    return 'AuthEvent.goHome()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GoHome);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result appStarted(),
    @required Result loggedIn(String uid),
    @required Result goHome(),
    @required Result logout(),
  }) {
    assert(appStarted != null);
    assert(loggedIn != null);
    assert(goHome != null);
    assert(logout != null);
    return goHome();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result appStarted(),
    Result loggedIn(String uid),
    Result goHome(),
    Result logout(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (goHome != null) {
      return goHome();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result appStarted(AppStarted value),
    @required Result loggedIn(LoggedIn value),
    @required Result goHome(GoHome value),
    @required Result logout(Logout value),
  }) {
    assert(appStarted != null);
    assert(loggedIn != null);
    assert(goHome != null);
    assert(logout != null);
    return goHome(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result appStarted(AppStarted value),
    Result loggedIn(LoggedIn value),
    Result goHome(GoHome value),
    Result logout(Logout value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (goHome != null) {
      return goHome(this);
    }
    return orElse();
  }
}

abstract class GoHome implements AuthEvent {
  const factory GoHome() = _$GoHome;
}

abstract class $LogoutCopyWith<$Res> {
  factory $LogoutCopyWith(Logout value, $Res Function(Logout) then) =
      _$LogoutCopyWithImpl<$Res>;
}

class _$LogoutCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $LogoutCopyWith<$Res> {
  _$LogoutCopyWithImpl(Logout _value, $Res Function(Logout) _then)
      : super(_value, (v) => _then(v as Logout));

  @override
  Logout get _value => super._value as Logout;
}

class _$Logout implements Logout {
  const _$Logout();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Logout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result appStarted(),
    @required Result loggedIn(String uid),
    @required Result goHome(),
    @required Result logout(),
  }) {
    assert(appStarted != null);
    assert(loggedIn != null);
    assert(goHome != null);
    assert(logout != null);
    return logout();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result appStarted(),
    Result loggedIn(String uid),
    Result goHome(),
    Result logout(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result appStarted(AppStarted value),
    @required Result loggedIn(LoggedIn value),
    @required Result goHome(GoHome value),
    @required Result logout(Logout value),
  }) {
    assert(appStarted != null);
    assert(loggedIn != null);
    assert(goHome != null);
    assert(logout != null);
    return logout(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result appStarted(AppStarted value),
    Result loggedIn(LoggedIn value),
    Result goHome(GoHome value),
    Result logout(Logout value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class Logout implements AuthEvent {
  const factory Logout() = _$Logout;
}

class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  AuthInitial initial() {
    return const AuthInitial();
  }

// ignore: unused_element
  Authenticated authenticated() {
    return const Authenticated();
  }

// ignore: unused_element
  Unauthenticated unauthenticated() {
    return const Unauthenticated();
  }

// ignore: unused_element
  LoggedOut loggedOut() {
    return const LoggedOut();
  }

// ignore: unused_element
  SurveyNotFilled surveyNotFilled() {
    return const SurveyNotFilled();
  }
}

// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

mixin _$AuthState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result loggedOut(),
    @required Result surveyNotFilled(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result loggedOut(),
    Result surveyNotFilled(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AuthInitial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
    @required Result loggedOut(LoggedOut value),
    @required Result surveyNotFilled(SurveyNotFilled value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AuthInitial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    Result loggedOut(LoggedOut value),
    Result surveyNotFilled(SurveyNotFilled value),
    @required Result orElse(),
  });
}

abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

abstract class $AuthInitialCopyWith<$Res> {
  factory $AuthInitialCopyWith(
          AuthInitial value, $Res Function(AuthInitial) then) =
      _$AuthInitialCopyWithImpl<$Res>;
}

class _$AuthInitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthInitialCopyWith<$Res> {
  _$AuthInitialCopyWithImpl(
      AuthInitial _value, $Res Function(AuthInitial) _then)
      : super(_value, (v) => _then(v as AuthInitial));

  @override
  AuthInitial get _value => super._value as AuthInitial;
}

class _$AuthInitial implements AuthInitial {
  const _$AuthInitial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result loggedOut(),
    @required Result surveyNotFilled(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loggedOut != null);
    assert(surveyNotFilled != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result loggedOut(),
    Result surveyNotFilled(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AuthInitial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
    @required Result loggedOut(LoggedOut value),
    @required Result surveyNotFilled(SurveyNotFilled value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loggedOut != null);
    assert(surveyNotFilled != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AuthInitial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    Result loggedOut(LoggedOut value),
    Result surveyNotFilled(SurveyNotFilled value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthInitial implements AuthState {
  const factory AuthInitial() = _$AuthInitial;
}

abstract class $AuthenticatedCopyWith<$Res> {
  factory $AuthenticatedCopyWith(
          Authenticated value, $Res Function(Authenticated) then) =
      _$AuthenticatedCopyWithImpl<$Res>;
}

class _$AuthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(
      Authenticated _value, $Res Function(Authenticated) _then)
      : super(_value, (v) => _then(v as Authenticated));

  @override
  Authenticated get _value => super._value as Authenticated;
}

class _$Authenticated implements Authenticated {
  const _$Authenticated();

  @override
  String toString() {
    return 'AuthState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Authenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result loggedOut(),
    @required Result surveyNotFilled(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loggedOut != null);
    assert(surveyNotFilled != null);
    return authenticated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result loggedOut(),
    Result surveyNotFilled(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AuthInitial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
    @required Result loggedOut(LoggedOut value),
    @required Result surveyNotFilled(SurveyNotFilled value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loggedOut != null);
    assert(surveyNotFilled != null);
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AuthInitial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    Result loggedOut(LoggedOut value),
    Result surveyNotFilled(SurveyNotFilled value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthState {
  const factory Authenticated() = _$Authenticated;
}

abstract class $UnauthenticatedCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(
          Unauthenticated value, $Res Function(Unauthenticated) then) =
      _$UnauthenticatedCopyWithImpl<$Res>;
}

class _$UnauthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(
      Unauthenticated _value, $Res Function(Unauthenticated) _then)
      : super(_value, (v) => _then(v as Unauthenticated));

  @override
  Unauthenticated get _value => super._value as Unauthenticated;
}

class _$Unauthenticated implements Unauthenticated {
  const _$Unauthenticated();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result loggedOut(),
    @required Result surveyNotFilled(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loggedOut != null);
    assert(surveyNotFilled != null);
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result loggedOut(),
    Result surveyNotFilled(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AuthInitial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
    @required Result loggedOut(LoggedOut value),
    @required Result surveyNotFilled(SurveyNotFilled value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loggedOut != null);
    assert(surveyNotFilled != null);
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AuthInitial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    Result loggedOut(LoggedOut value),
    Result surveyNotFilled(SurveyNotFilled value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthState {
  const factory Unauthenticated() = _$Unauthenticated;
}

abstract class $LoggedOutCopyWith<$Res> {
  factory $LoggedOutCopyWith(LoggedOut value, $Res Function(LoggedOut) then) =
      _$LoggedOutCopyWithImpl<$Res>;
}

class _$LoggedOutCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $LoggedOutCopyWith<$Res> {
  _$LoggedOutCopyWithImpl(LoggedOut _value, $Res Function(LoggedOut) _then)
      : super(_value, (v) => _then(v as LoggedOut));

  @override
  LoggedOut get _value => super._value as LoggedOut;
}

class _$LoggedOut implements LoggedOut {
  const _$LoggedOut();

  @override
  String toString() {
    return 'AuthState.loggedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoggedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result loggedOut(),
    @required Result surveyNotFilled(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loggedOut != null);
    assert(surveyNotFilled != null);
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result loggedOut(),
    Result surveyNotFilled(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AuthInitial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
    @required Result loggedOut(LoggedOut value),
    @required Result surveyNotFilled(SurveyNotFilled value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loggedOut != null);
    assert(surveyNotFilled != null);
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AuthInitial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    Result loggedOut(LoggedOut value),
    Result surveyNotFilled(SurveyNotFilled value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class LoggedOut implements AuthState {
  const factory LoggedOut() = _$LoggedOut;
}

abstract class $SurveyNotFilledCopyWith<$Res> {
  factory $SurveyNotFilledCopyWith(
          SurveyNotFilled value, $Res Function(SurveyNotFilled) then) =
      _$SurveyNotFilledCopyWithImpl<$Res>;
}

class _$SurveyNotFilledCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $SurveyNotFilledCopyWith<$Res> {
  _$SurveyNotFilledCopyWithImpl(
      SurveyNotFilled _value, $Res Function(SurveyNotFilled) _then)
      : super(_value, (v) => _then(v as SurveyNotFilled));

  @override
  SurveyNotFilled get _value => super._value as SurveyNotFilled;
}

class _$SurveyNotFilled implements SurveyNotFilled {
  const _$SurveyNotFilled();

  @override
  String toString() {
    return 'AuthState.surveyNotFilled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SurveyNotFilled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result loggedOut(),
    @required Result surveyNotFilled(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loggedOut != null);
    assert(surveyNotFilled != null);
    return surveyNotFilled();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result loggedOut(),
    Result surveyNotFilled(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (surveyNotFilled != null) {
      return surveyNotFilled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AuthInitial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
    @required Result loggedOut(LoggedOut value),
    @required Result surveyNotFilled(SurveyNotFilled value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(loggedOut != null);
    assert(surveyNotFilled != null);
    return surveyNotFilled(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AuthInitial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    Result loggedOut(LoggedOut value),
    Result surveyNotFilled(SurveyNotFilled value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (surveyNotFilled != null) {
      return surveyNotFilled(this);
    }
    return orElse();
  }
}

abstract class SurveyNotFilled implements AuthState {
  const factory SurveyNotFilled() = _$SurveyNotFilled;
}
