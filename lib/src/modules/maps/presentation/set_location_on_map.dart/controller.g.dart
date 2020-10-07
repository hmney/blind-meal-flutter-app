// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SetLocationOnMapController on _SetLocationOnMapController, Store {
  final _$onMoveLocationAtom =
      Atom(name: '_SetLocationOnMapController.onMoveLocation');

  @override
  CameraPosition get onMoveLocation {
    _$onMoveLocationAtom.reportRead();
    return super.onMoveLocation;
  }

  @override
  set onMoveLocation(CameraPosition value) {
    _$onMoveLocationAtom.reportWrite(value, super.onMoveLocation, () {
      super.onMoveLocation = value;
    });
  }

  final _$_SetLocationOnMapControllerActionController =
      ActionController(name: '_SetLocationOnMapController');

  @override
  void setOnMoveLocation(CameraPosition position) {
    final _$actionInfo = _$_SetLocationOnMapControllerActionController
        .startAction(name: '_SetLocationOnMapController.setOnMoveLocation');
    try {
      return super.setOnMoveLocation(position);
    } finally {
      _$_SetLocationOnMapControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
onMoveLocation: ${onMoveLocation}
    ''';
  }
}
