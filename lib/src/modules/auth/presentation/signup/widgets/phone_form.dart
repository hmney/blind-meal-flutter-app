import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/module.dart';
import 'package:app/src/modules/auth/presentation/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PhoneFormWidget extends StatefulWidget {
  final AuthController controller;
  PhoneFormWidget({Key key, this.controller}) : super(key: key);

  @override
  _PhoneFormWidgetState createState() => _PhoneFormWidgetState();
}

class _PhoneFormWidgetState extends State<PhoneFormWidget> {
  final _phoneController = TextEditingController();
  AuthController get _controller => widget.controller;

  String _validatorPhoneNumber(String value) {
    if (value.isEmpty || value.length < 9) return 'Enter a valid phone number';
    return null;
  }

  void _savePhoneNumber(String value) {
    _controller.user.phone =
        '+${_controller.countryPhone.callingCodes.first}$value';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Phone Number',
            style: TextStyle(
              color: Color(0xff707070),
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: GestureDetector(
                onTap: () async {
                  var country = await AuthModule.toCountryPickerScreen();
                  if (country != null && country != _controller.countryPhone) {
                    _controller.countryPhone = country;
                  }
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Observer(
                    builder: (_) => _controller.countryPhone != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 28,
                                height: 28,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                      'icons/flags/png/${_controller.countryPhone.alpha2Code.toLowerCase()}.png',
                                      fit: BoxFit.cover,
                                      package: 'country_icons'),
                                ),
                              ),
                              Text(
                                '+${_controller.countryPhone.callingCodes.first}',
                              ),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          )
                        : Container(),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              flex: 2,
              child: TextFormField(
                controller: _phoneController,
                validator: _validatorPhoneNumber,
                onSaved: _savePhoneNumber,
                cursorColor: AppTheme.primaryColor,
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(12),
                ],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  hintText: 'Enter phone number',
                  hintStyle: TextStyle(
                    color: Color(0xffacacac),
                    fontFamily: 'Roboto',
                    fontSize: 14,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 0,
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
        ),
      ],
    );
  }
}
