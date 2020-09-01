import 'package:app/src/modules/app/presentation/home.dart';
import 'package:app/src/modules/auth/data/repository/auth_repository_implementation.dart';
import 'package:app/src/modules/auth/data/repository/user_repository_implementation.dart';
import 'package:app/src/modules/auth/presentation/controller.dart';
import 'package:app/src/modules/auth/presentation/index.dart';
import 'package:app/src/modules/auth/presentation/login/index.dart';
import 'package:app/src/modules/auth/presentation/signup/country_picker/index.dart';
import 'package:app/src/modules/auth/presentation/signup/index.dart';
import 'package:app/src/modules/auth/presentation/onboarding/controller.dart';
import 'package:app/src/modules/auth/presentation/survey/controller.dart';
import 'package:app/src/modules/auth/presentation/survey/index.dart';
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
        Bind((i) => SurveyController()),
      ];
  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AuthScreen()),
        Router(LOGIN_SCREEN, child: (_, args) => LoginScreen()),
        Router(SIGNUP_SCREEN, child: (_, args) => SignupScreen()),
        Router<Country>(COUNTRY_PICKER, child: (_, args) => CountryPicker()),
        Router(HOME_SCREEN, child: (_, args) => HomeScreen()),
        Router<bool>(SURVEY_SCREEN, child: (_, args) => SurveyScreen()),
        Router(START_SURVEY, child: (_, args) => StartSurvey()),
      ];

  static const LOGIN_SCREEN = '/login';
  static Future toLoginScreen() => Modular.to.pushNamed(LOGIN_SCREEN);

  static const SIGNUP_SCREEN = '/signup';
  static Future toSignupScreen() => Modular.to.pushNamed(SIGNUP_SCREEN);

  static const COUNTRY_PICKER = '/country_picker';
  static Future<Country> toCountryPickerScreen() =>
      Modular.to.pushNamed(COUNTRY_PICKER);

  static const HOME_SCREEN = '/home';
  static Future toHomeScreen() => Modular.to.pushNamedAndRemoveUntil(
        HOME_SCREEN,
        (route) => route.isFirst,
      );

  static const SURVEY_SCREEN = '/survey';
  static Future<bool> toSurveyScreen() => Modular.to.pushNamed(SURVEY_SCREEN);

  static const START_SURVEY = '/start_survey';
  static Future toStartSurvey() => Modular.to.pushNamed(START_SURVEY);
}
