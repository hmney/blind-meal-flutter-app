import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/presentation/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordField extends StatefulWidget {
  final AuthController controller;
  PasswordField({Key key, this.controller}) : super(key: key);
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final _passwordController = TextEditingController();
  AuthController get _controller => widget.controller;
  bool _isObscure = true;
  String _validatorPassword(String value) {
    if (value.isEmpty || value.length < 8)
      return 'Please enter a valid password';
    return null;
  }

  void _savePassword(String value) {
    _controller.password = value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Password',
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
            controller: _passwordController,
            validator: _validatorPassword,
            onSaved: _savePassword,
            obscureText: _isObscure,
            cursorColor: AppTheme.primaryColor,
            inputFormatters: [
              LengthLimitingTextInputFormatter(20),
            ],
            decoration: InputDecoration(
              hintText: 'Enter your password',
              hintStyle: TextStyle(
                color: Color(0xffacacac),
                fontFamily: 'Roboto',
                fontSize: 14,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: Icon(
                  Icons.remove_red_eye,
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
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
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            print('Forget Password');
          },
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot password ?',
              style: TextStyle(
                color: Color(0xff707070),
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
