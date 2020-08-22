import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/module.dart';
import 'package:app/src/modules/auth/presentation/signup/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CountryField extends StatefulWidget {
  final SignupController controller;
  CountryField({Key key, this.controller}) : super(key: key);

  @override
  _CountryFieldState createState() => _CountryFieldState();
}

class _CountryFieldState extends State<CountryField> {
  final _countryListController = TextEditingController();

  SignupController get _controller => widget.controller;
  String _validatorCountryList(String value) {
    if (value.isEmpty) return 'Enter your country';
    return null;
  }

  void _saveCountryList(String value) {
    _controller.user.country = value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Country',
            style: TextStyle(
              color: Color(0xff707070),
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 10),
        Observer(
          builder: (_) => TextFormField(
            controller: _countryListController,
            validator: _validatorCountryList,
            onSaved: _saveCountryList,
            readOnly: true,
            onTap: () async {
              var country = await AuthModule.toCountryPickerScreen();
              if (country != null) {
                _controller.countryResidence = country;
                _countryListController.text = country.name;
              }
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              hintStyle: TextStyle(
                color: Color(0xffacacac),
                fontFamily: 'Roboto',
                fontSize: 14,
              ),
              hintText: 'select your country',
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
              prefixIcon: _controller.countryResidence != null
                  ? Container(
                      width: 32,
                      height: 32,
                      padding: EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'icons/flags/png/${_controller.countryResidence.alpha2Code.toLowerCase()}.png',
                          fit: BoxFit.cover,
                          package: 'country_icons',
                        ),
                      ),
                    )
                  : null,
              suffixIcon: Icon(Icons.unfold_more),
            ),
          ),
        ),
      ],
    );
  }
}
