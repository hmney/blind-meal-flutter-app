// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryLocation _$DeliveryLocationFromJson(Map<String, dynamic> json) {
  return DeliveryLocation(
    type: _$enumDecodeNullable(_$DELIVERY_LOCATION_TYPEEnumMap, json['type']),
    address: _DeliveryLocation._addressFromJson(json['address']),
    addressName: json['addressName'] as String,
    areaName: json['areaName'] as String,
    streetName: json['streetName'] as String,
    buildingNumber: json['buildingNumber'] as String,
    buildingName: json['buildingName'] as String,
    additionalInstructions: json['additionalInstructions'] as String,
  );
}

Map<String, dynamic> _$DeliveryLocationToJson(DeliveryLocation instance) =>
    <String, dynamic>{
      'address': _DeliveryLocation._addressToJson(instance.address),
      'type': _$DELIVERY_LOCATION_TYPEEnumMap[instance.type],
      'addressName': instance.addressName,
      'areaName': instance.areaName,
      'streetName': instance.streetName,
      'buildingNumber': instance.buildingNumber,
      'buildingName': instance.buildingName,
      'additionalInstructions': instance.additionalInstructions,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$DELIVERY_LOCATION_TYPEEnumMap = {
  DELIVERY_LOCATION_TYPE.WORK: 'WORK',
  DELIVERY_LOCATION_TYPE.HOME: 'HOME',
  DELIVERY_LOCATION_TYPE.OTHER: 'OTHER',
  DELIVERY_LOCATION_TYPE.NONE: 'NONE',
};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DeliveryLocation on _DeliveryLocation, Store {
  final _$addressAtom = Atom(name: '_DeliveryLocation.address');

  @override
  Address get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$typeAtom = Atom(name: '_DeliveryLocation.type');

  @override
  DELIVERY_LOCATION_TYPE get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(DELIVERY_LOCATION_TYPE value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$addressNameAtom = Atom(name: '_DeliveryLocation.addressName');

  @override
  String get addressName {
    _$addressNameAtom.reportRead();
    return super.addressName;
  }

  @override
  set addressName(String value) {
    _$addressNameAtom.reportWrite(value, super.addressName, () {
      super.addressName = value;
    });
  }

  final _$areaNameAtom = Atom(name: '_DeliveryLocation.areaName');

  @override
  String get areaName {
    _$areaNameAtom.reportRead();
    return super.areaName;
  }

  @override
  set areaName(String value) {
    _$areaNameAtom.reportWrite(value, super.areaName, () {
      super.areaName = value;
    });
  }

  final _$streetNameAtom = Atom(name: '_DeliveryLocation.streetName');

  @override
  String get streetName {
    _$streetNameAtom.reportRead();
    return super.streetName;
  }

  @override
  set streetName(String value) {
    _$streetNameAtom.reportWrite(value, super.streetName, () {
      super.streetName = value;
    });
  }

  final _$buildingNumberAtom = Atom(name: '_DeliveryLocation.buildingNumber');

  @override
  String get buildingNumber {
    _$buildingNumberAtom.reportRead();
    return super.buildingNumber;
  }

  @override
  set buildingNumber(String value) {
    _$buildingNumberAtom.reportWrite(value, super.buildingNumber, () {
      super.buildingNumber = value;
    });
  }

  final _$buildingNameAtom = Atom(name: '_DeliveryLocation.buildingName');

  @override
  String get buildingName {
    _$buildingNameAtom.reportRead();
    return super.buildingName;
  }

  @override
  set buildingName(String value) {
    _$buildingNameAtom.reportWrite(value, super.buildingName, () {
      super.buildingName = value;
    });
  }

  final _$additionalInstructionsAtom =
      Atom(name: '_DeliveryLocation.additionalInstructions');

  @override
  String get additionalInstructions {
    _$additionalInstructionsAtom.reportRead();
    return super.additionalInstructions;
  }

  @override
  set additionalInstructions(String value) {
    _$additionalInstructionsAtom
        .reportWrite(value, super.additionalInstructions, () {
      super.additionalInstructions = value;
    });
  }

  final _$_DeliveryLocationActionController =
      ActionController(name: '_DeliveryLocation');

  @override
  void setAddress(Address value) {
    final _$actionInfo = _$_DeliveryLocationActionController.startAction(
        name: '_DeliveryLocation.setAddress');
    try {
      return super.setAddress(value);
    } finally {
      _$_DeliveryLocationActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDeliveryLocationType(DELIVERY_LOCATION_TYPE value) {
    final _$actionInfo = _$_DeliveryLocationActionController.startAction(
        name: '_DeliveryLocation.setDeliveryLocationType');
    try {
      return super.setDeliveryLocationType(value);
    } finally {
      _$_DeliveryLocationActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateAddressName(String value) {
    final _$actionInfo = _$_DeliveryLocationActionController.startAction(
        name: '_DeliveryLocation.validateAddressName');
    try {
      return super.validateAddressName(value);
    } finally {
      _$_DeliveryLocationActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateAreaName(String value) {
    final _$actionInfo = _$_DeliveryLocationActionController.startAction(
        name: '_DeliveryLocation.validateAreaName');
    try {
      return super.validateAreaName(value);
    } finally {
      _$_DeliveryLocationActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateStreetName(String value) {
    final _$actionInfo = _$_DeliveryLocationActionController.startAction(
        name: '_DeliveryLocation.validateStreetName');
    try {
      return super.validateStreetName(value);
    } finally {
      _$_DeliveryLocationActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateBuildingNumber(String value) {
    final _$actionInfo = _$_DeliveryLocationActionController.startAction(
        name: '_DeliveryLocation.validateBuildingNumber');
    try {
      return super.validateBuildingNumber(value);
    } finally {
      _$_DeliveryLocationActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateBuildingName(String value) {
    final _$actionInfo = _$_DeliveryLocationActionController.startAction(
        name: '_DeliveryLocation.validateBuildingName');
    try {
      return super.validateBuildingName(value);
    } finally {
      _$_DeliveryLocationActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateAdditionalInstructions(String value) {
    final _$actionInfo = _$_DeliveryLocationActionController.startAction(
        name: '_DeliveryLocation.validateAdditionalInstructions');
    try {
      return super.validateAdditionalInstructions(value);
    } finally {
      _$_DeliveryLocationActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
address: ${address},
type: ${type},
addressName: ${addressName},
areaName: ${areaName},
streetName: ${streetName},
buildingNumber: ${buildingNumber},
buildingName: ${buildingName},
additionalInstructions: ${additionalInstructions}
    ''';
  }
}
