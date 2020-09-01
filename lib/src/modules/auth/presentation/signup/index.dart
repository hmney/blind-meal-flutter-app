import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/presentation/controller.dart';
import 'package:app/src/modules/auth/presentation/signup/widgets/birthdate.dart';
import 'package:app/src/modules/auth/presentation/signup/widgets/country_list.dart';
import 'package:app/src/modules/auth/presentation/signup/widgets/email.dart';
import 'package:app/src/modules/auth/presentation/signup/widgets/password.dart';
import 'package:app/src/modules/auth/presentation/signup/widgets/phone_form.dart';
import 'package:app/src/modules/auth/presentation/signup/widgets/username.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends ModularState<SignupScreen, AuthController> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.signupScaffoldKey,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Modular.to.pop(),
                          child: Container(
                            child: SvgPicture.asset(
                              'assets/icons/cancel.svg',
                              width: 18,
                              height: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    NameField(controller: controller),
                    SizedBox(height: 20),
                    BirthdateField(controller: controller),
                    SizedBox(height: 20),
                    PhoneFormWidget(controller: controller),
                    SizedBox(height: 20),
                    EmailField(controller: controller),
                    SizedBox(height: 20),
                    PasswordField(controller: controller),
                    SizedBox(height: 20),
                    CountryField(controller: controller),
                    SizedBox(height: 30),
                    Container(
                      width: 300,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            await controller
                                .authentication(AUTHENTICATION.SIGN_UP);
                          }
                        },
                        color: AppTheme.primaryColor,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20)
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
