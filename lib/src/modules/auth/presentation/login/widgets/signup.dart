import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/module.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupButton extends StatefulWidget {
  @override
  _SignupButtonState createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                color: Color(0xff707070),
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            TextSpan(
              text: 'Sign up',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  AuthModule.toSignupScreen();
                },
            )
          ],
        ),
      ),
    );
  }
}
