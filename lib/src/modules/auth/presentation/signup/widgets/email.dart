import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/presentation/signup/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';

class EmailField extends StatefulWidget {
  final SignupController controller;
  EmailField({Key key, this.controller}) : super(key: key);
  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  final _emailController = TextEditingController();
  SignupController get _controller => widget.controller;

  String _validatorEmail(String value) {
    if (!EmailValidator.validate(value)) return 'Please enter a valid Email';
    return null;
  }

  void _saveEmail(String value) {
    _controller.user.email = value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Email',
            style: TextStyle(
              color: Color(0xff707070),
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          child: TextFormField(
            controller: _emailController,
            validator: _validatorEmail,
            onSaved: _saveEmail,
            cursorColor: AppTheme.primaryColor,
            keyboardType: TextInputType.emailAddress,
            inputFormatters: [
              LengthLimitingTextInputFormatter(40),
            ],
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              hintText: 'john.doe@email.com',
              hintStyle: TextStyle(
                color: Color(0xffacacac),
                fontFamily: 'Roboto',
                fontSize: 14,
              ),
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: AppTheme.primaryColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
