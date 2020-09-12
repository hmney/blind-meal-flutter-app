import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/presentation/controller.dart';
import 'package:app/src/modules/auth/presentation/login/widgets/email.dart';
import 'package:app/src/modules/auth/presentation/login/widgets/password.dart';
import 'package:app/src/modules/auth/presentation/login/widgets/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final controller = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.loginScaffoldKey,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/logo/Logo-Colored.svg',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    SizedBox(height: 20),
                    EmailField(controller: controller),
                    SizedBox(height: 20),
                    PasswordField(controller: controller),
                    SizedBox(height: 50),
                    Container(
                      width: 300,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            await controller
                                .authentication(AUTHENTICATION.SIGN_IN);
                          }
                        },
                        color: AppTheme.primaryColor,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SignupButton(),
                    SizedBox(height: 50),
                    Container(
                      width: 90,
                      child: Divider(color: Color(0xffC2BABA)),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/social_media/facebook_icon.svg',
                          width: 26,
                          height: 26,
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () => controller
                              .authentication(AUTHENTICATION.GOOGLE_AUTH),
                          child: SvgPicture.asset(
                            'assets/icons/social_media/google_icon.svg',
                            width: 26,
                            height: 26,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
