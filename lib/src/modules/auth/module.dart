import 'package:app/src/modules/app/presentation/home.dart';
import 'package:app/src/modules/auth/data/repository/auth_repository_implementation.dart';
import 'package:app/src/modules/auth/data/repository/user_repository_implementation.dart';
import 'package:app/src/modules/auth/presentation/auth/controller.dart';
import 'package:app/src/modules/auth/presentation/auth/index.dart';
import 'package:app/src/modules/auth/presentation/login/controller.dart';
import 'package:app/src/modules/auth/presentation/login/index.dart';
import 'package:app/src/modules/auth/presentation/onboarding/controller.dart';
import 'package:app/src/modules/auth/presentation/signup/controller.dart';
import 'package:app/src/modules/auth/presentation/signup/country_picker/index.dart';
import 'package:app/src/modules/auth/presentation/signup/index.dart';
import 'package:country_provider/country_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthRepositoryImplementation()),
        Bind((i) => UserRepositoryImplementation()),
        Bind((i) => FirebaseAnalytics()),
        Bind((i) => AuthController()),
        Bind((i) => OnboardingController()),
        Bind((i) => LoginController()),
        Bind((i) => SignupController()),
      ];
  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AuthScreen()),
        Router(LOGIN_SCREEN, child: (_, args) => LoginScreen()),
        Router(SIGNUP_SCREEN, child: (_, args) => SignupScreen()),
        Router<Country>(COUNTRY_PICKER, child: (_, args) => CountryPicker()),
        Router(HOME_SCREEN, child: (_, args) => HomeScreen()),
      ];
  static const LOGIN_SCREEN = '/login';
  static Future toLoginScreen() =>
      Modular.to.pushNamedAndRemoveUntil(LOGIN_SCREEN, (route) => false);

  static const SIGNUP_SCREEN = '/signup';
  static Future toSignupScreen() => Modular.to.pushNamed(SIGNUP_SCREEN);

  static const COUNTRY_PICKER = '/country_picker';
  static Future<Country> toCountryPickerScreen() =>
      Modular.to.pushNamed(COUNTRY_PICKER);

  static const HOME_SCREEN = '/home';
  static Future toHomeScreen() => Modular.to.pushNamedAndRemoveUntil(
        HOME_SCREEN,
        (_) => false,
      );
}
