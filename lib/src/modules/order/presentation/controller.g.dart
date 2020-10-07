// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderController on _OrderController, Store {
  final _$deliveryLocationAddressAtom =
      Atom(name: '_OrderController.deliveryLocationAddress');

  @override
  TextEditingController get deliveryLocationAddress {
    _$deliveryLocationAddressAtom.reportRead();
    return super.deliveryLocationAddress;
  }

  @override
  set deliveryLocationAddress(TextEditingController value) {
    _$deliveryLocationAddressAtom
        .reportWrite(value, super.deliveryLocationAddress, () {
      super.deliveryLocationAddress = value;
    });
  }

  final _$pageIndexAtom = Atom(name: '_OrderController.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  final _$_OrderControllerActionController =
      ActionController(name: '_OrderController');

  @override
  void setDeliveryLocationAddress(String value) {
    final _$actionInfo = _$_OrderControllerActionController.startAction(
        name: '_OrderController.setDeliveryLocationAddress');
    try {
      return super.setDeliveryLocationAddress(value);
    } finally {
      _$_OrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChangePageIndex(int index) {
    final _$actionInfo = _$_OrderControllerActionController.startAction(
        name: '_OrderController.onChangePageIndex');
    try {
      return super.onChangePageIndex(index);
    } finally {
      _$_OrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
deliveryLocationAddress: ${deliveryLocationAddress},
pageIndex: ${pageIndex}
    ''';
  }
}
