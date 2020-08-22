// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupController on _SignupController, Store {
  final _$countryPhoneAtom = Atom(name: '_SignupController.countryPhone');

  @override
  Country get countryPhone {
    _$countryPhoneAtom.reportRead();
    return super.countryPhone;
  }

  @override
  set countryPhone(Country value) {
    _$countryPhoneAtom.reportWrite(value, super.countryPhone, () {
      super.countryPhone = value;
    });
  }

  final _$countryResidenceAtom =
      Atom(name: '_SignupController.countryResidence');

  @override
  Country get countryResidence {
    _$countryResidenceAtom.reportRead();
    return super.countryResidence;
  }

  @override
  set countryResidence(Country value) {
    _$countryResidenceAtom.reportWrite(value, super.countryResidence, () {
      super.countryResidence = value;
    });
  }

  @override
  String toString() {
    return '''
countryPhone: ${countryPhone},
countryResidence: ${countryResidence}
    ''';
  }
}
