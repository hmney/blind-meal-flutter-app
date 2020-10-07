// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapsController on _MapsController, Store {
  final _$deliveryLocationAtom = Atom(name: '_MapsController.deliveryLocation');

  @override
  DeliveryLocation get deliveryLocation {
    _$deliveryLocationAtom.reportRead();
    return super.deliveryLocation;
  }

  @override
  set deliveryLocation(DeliveryLocation value) {
    _$deliveryLocationAtom.reportWrite(value, super.deliveryLocation, () {
      super.deliveryLocation = value;
    });
  }

  final _$isSearchingAtom = Atom(name: '_MapsController.isSearching');

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  final _$deliveryLocationSearchAtom =
      Atom(name: '_MapsController.deliveryLocationSearch');

  @override
  String get deliveryLocationSearch {
    _$deliveryLocationSearchAtom.reportRead();
    return super.deliveryLocationSearch;
  }

  @override
  set deliveryLocationSearch(String value) {
    _$deliveryLocationSearchAtom
        .reportWrite(value, super.deliveryLocationSearch, () {
      super.deliveryLocationSearch = value;
    });
  }

  final _$_MapsControllerActionController =
      ActionController(name: '_MapsController');

  @override
  void setSearching(bool value) {
    final _$actionInfo = _$_MapsControllerActionController.startAction(
        name: '_MapsController.setSearching');
    try {
      return super.setSearching(value);
    } finally {
      _$_MapsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDeliveryLocationSearch(String value) {
    final _$actionInfo = _$_MapsControllerActionController.startAction(
        name: '_MapsController.setDeliveryLocationSearch');
    try {
      return super.setDeliveryLocationSearch(value);
    } finally {
      _$_MapsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
deliveryLocation: ${deliveryLocation},
isSearching: ${isSearching},
deliveryLocationSearch: ${deliveryLocationSearch}
    ''';
  }
}
