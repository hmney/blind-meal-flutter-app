import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/presentation/signup/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NameField extends StatefulWidget {
  final SignupController controller;
  NameField({Key key, this.controller}) : super(key: key);

  @override
  _NameFieldState createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  SignupController get _controller => widget.controller;

  String _validatorFirstName(String value) {
    if (value.isEmpty || value.length < 3) return 'First name not valid';
    return null;
  }

  void _saveFirstName(String value) {
    _controller.user.firstName = value;
  }

  String _validatorLastName(String value) {
    if (value.isEmpty || value.length < 3) return 'Last name not valid';
    return null;
  }

  void _saveLastName(String value) {
    _controller.user.lastName = value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'First Name',
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _firstNameController,
                validator: _validatorFirstName,
                onSaved: _saveFirstName,
                cursorColor: AppTheme.primaryColor,
                keyboardType: TextInputType.name,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                ],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  hintText: 'John',
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
                    borderSide: BorderSide(color: AppTheme.primaryColor),
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
            ],
          ),
        ),
        SizedBox(width: 10),
        Flexible(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Last Name',
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _lastNameController,
                validator: _validatorLastName,
                onSaved: _saveLastName,
                cursorColor: AppTheme.primaryColor,
                keyboardType: TextInputType.name,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15),
                ],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10, right: 10),
                  hintText: 'Doe',
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
                    borderSide: BorderSide(color: AppTheme.primaryColor),
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
            ],
          ),
        )
      ],
    );
  }
}
