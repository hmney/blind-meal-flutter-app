// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SavedPlacesController on _SavedPlacesController, Store {
  final _$deliveryLocationsAtom =
      Atom(name: '_SavedPlacesController.deliveryLocations');

  @override
  ObservableList<DeliveryLocation> get deliveryLocations {
    _$deliveryLocationsAtom.reportRead();
    return super.deliveryLocations;
  }

  @override
  set deliveryLocations(ObservableList<DeliveryLocation> value) {
    _$deliveryLocationsAtom.reportWrite(value, super.deliveryLocations, () {
      super.deliveryLocations = value;
    });
  }

  final _$_SavedPlacesControllerActionController =
      ActionController(name: '_SavedPlacesController');

  @override
  void setDeliveryLocations(List<DeliveryLocation> value) {
    final _$actionInfo = _$_SavedPlacesControllerActionController.startAction(
        name: '_SavedPlacesController.setDeliveryLocations');
    try {
      return super.setDeliveryLocations(value);
    } finally {
      _$_SavedPlacesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
deliveryLocations: ${deliveryLocations}
    ''';
  }
}
