import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/presentation/controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthdateField extends StatefulWidget {
  final AuthController controller;
  BirthdateField({Key key, this.controller}) : super(key: key);

  @override
  _BirthdateFieldState createState() => _BirthdateFieldState();
}

class _BirthdateFieldState extends State<BirthdateField> {
  final _birthdateController = TextEditingController();
  AuthController get _controller => widget.controller;
  var _birthdate;
  String _validatorBirthdate(String value) {
    if (value.isEmpty) return 'Enter your birthdate';
    return null;
  }

  void _saveBirthdate(String value) {
    _controller.user.birthdate = _birthdate;
  }

  void _showBirthdatePicker() async {
    var birthdatePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      helpText: 'SELECT YOUR BIRTHDATE',
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppTheme.primaryColor,
            accentColor: AppTheme.primaryColor,
            colorScheme: ColorScheme.light(primary: AppTheme.primaryColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
    );
    if (birthdatePicked != null && birthdatePicked != _birthdate) {
      _birthdate = birthdatePicked;
      _birthdateController.text =
          DateFormat('d MMMM y').format(birthdatePicked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Birthdate',
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
          controller: _birthdateController,
          validator: _validatorBirthdate,
          onSaved: _saveBirthdate,
          readOnly: true,
          onTap: () => _showBirthdatePicker(),
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.date_range,
              color: Colors.black,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            hintText: '16 october 1998',
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
              borderSide: BorderSide(color: Colors.white),
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
        )
      ],
    );
  }
}
