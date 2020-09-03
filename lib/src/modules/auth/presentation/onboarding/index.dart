import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/module.dart';
import 'package:app/src/modules/auth/presentation/controller.dart';
import 'package:app/src/modules/auth/presentation/onboarding/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreens extends StatefulWidget {
  @override
  _OnboardingScreensState createState() => _OnboardingScreensState();
}

class _OnboardingScreensState
    extends ModularState<OnboardingScreens, OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IntroductionScreen(
            pages: [
              PageViewModel(
                title: 'Avoid wasting your time',
                body:
                    'Do you always misspend your time thinking about what to eat and you end up ordering the same thing?',
                image: Center(
                  child: SvgPicture.asset(
                    'assets/onboarding/onboarding_1.svg',
                    width: 300,
                    height: 230,
                  ),
                ),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: 'New meals according to your mood',
                body:
                    'Are you afraid of trying new meals? Do you want to eat the best meal each time?',
                image: Center(
                  child: SvgPicture.asset(
                    'assets/onboarding/onboarding_2.svg',
                    width: 250,
                    height: 250,
                  ),
                ),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: 'Our Solution',
                body:
                    'We will save you the hassle of food choice and deliver to you what will perfectly suit your hunger.',
                image: Center(
                  child: SvgPicture.asset(
                    'assets/onboarding/onboarding_3.svg',
                    width: 300,
                    height: 210,
                  ),
                ),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: 'What we need from you',
                body:
                    'We will save you the hassle of food choice and deliver to you what will perfectly suit your hunger.',
                image: Center(
                  child: SvgPicture.asset(
                    'assets/onboarding/onboarding_4.svg',
                    width: 300,
                    height: 210,
                  ),
                ),
                footer: Container(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () => AuthModule.toLoginScreen(),
                    color: AppTheme.primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      'GET STARTED',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                decoration: pageDecoration,
              ),
            ],
            done: Container(),
            onDone: () {},
            dotsDecorator: DotsDecorator(activeColor: AppTheme.primaryColor),
          ),
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(top: 50),
            child: FlatButton(
              child: Text('skip'),
              onPressed: () => Modular.get<AuthController>().authState =
                  AuthState.loggedOut(),
            ),
          ),
        ],
      ),
    );
  }

  final pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Roboto'),
    bodyTextStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Color(0xff686868),
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal),
    pageColor: Color(0xfff6f6f6),
    imagePadding: EdgeInsets.only(
      top: 120,
    ),
    titlePadding: EdgeInsets.only(
      top: 80,
    ),
    descriptionPadding: EdgeInsets.only(top: 20),
    footerPadding: EdgeInsets.only(top: 30),
  );
}
