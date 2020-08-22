import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/module.dart';
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
                title: 'Waste time',
                body:
                    'Do you spend time every day thinking about what to eat and end up ordering the same thing?',
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
                    ' Are you afraid from trying new meals?  Want to eat according to your mood and bring it to you?',
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
                    'We are helping you skip the whole long process of getting food and get directly your favorite meal.',
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
                    'All what you have to do is fill information once, give us an overview about your taste and our incredible intelligent machine will bring you what you want to eat.',
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
              onPressed: () => AuthModule.toLoginScreen(),
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
