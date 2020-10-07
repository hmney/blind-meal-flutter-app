// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdditionalInformationsController
    on _AdditionalInformationsController, Store {
  final _$saveDeliveryLocationAtom =
      Atom(name: '_AdditionalInformationsController.saveDeliveryLocation');

  @override
  bool get saveDeliveryLocation {
    _$saveDeliveryLocationAtom.reportRead();
    return super.saveDeliveryLocation;
  }

  @override
  set saveDeliveryLocation(bool value) {
    _$saveDeliveryLocationAtom.reportWrite(value, super.saveDeliveryLocation,
        () {
      super.saveDeliveryLocation = value;
    });
  }

  final _$_AdditionalInformationsControllerActionController =
      ActionController(name: '_AdditionalInformationsController');

  @override
  void setSaveDeliveryLocation(bool value) {
    final _$actionInfo =
        _$_AdditionalInformationsControllerActionController.startAction(
            name: '_AdditionalInformationsController.setSaveDeliveryLocation');
    try {
      return super.setSaveDeliveryLocation(value);
    } finally {
      _$_AdditionalInformationsControllerActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
saveDeliveryLocation: ${saveDeliveryLocation}
    ''';
  }
}
