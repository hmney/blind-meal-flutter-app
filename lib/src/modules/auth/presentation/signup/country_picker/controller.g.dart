// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CountryPickerController on _CountryPickerController, Store {
  final _$searchQueryAtom = Atom(name: '_CountryPickerController.searchQuery');

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  final _$searchingAtom = Atom(name: '_CountryPickerController.searching');

  @override
  bool get searching {
    _$searchingAtom.reportRead();
    return super.searching;
  }

  @override
  set searching(bool value) {
    _$searchingAtom.reportWrite(value, super.searching, () {
      super.searching = value;
    });
  }

  final _$elevationAtom = Atom(name: '_CountryPickerController.elevation');

  @override
  double get elevation {
    _$elevationAtom.reportRead();
    return super.elevation;
  }

  @override
  set elevation(double value) {
    _$elevationAtom.reportWrite(value, super.elevation, () {
      super.elevation = value;
    });
  }

  final _$actionIconAtom = Atom(name: '_CountryPickerController.actionIcon');

  @override
  Icon get actionIcon {
    _$actionIconAtom.reportRead();
    return super.actionIcon;
  }

  @override
  set actionIcon(Icon value) {
    _$actionIconAtom.reportWrite(value, super.actionIcon, () {
      super.actionIcon = value;
    });
  }

  final _$appBarTitleAtom = Atom(name: '_CountryPickerController.appBarTitle');

  @override
  Widget get appBarTitle {
    _$appBarTitleAtom.reportRead();
    return super.appBarTitle;
  }

  @override
  set appBarTitle(Widget value) {
    _$appBarTitleAtom.reportWrite(value, super.appBarTitle, () {
      super.appBarTitle = value;
    });
  }

  final _$_CountryPickerControllerActionController =
      ActionController(name: '_CountryPickerController');

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$_CountryPickerControllerActionController.startAction(
        name: '_CountryPickerController.setSearchQuery');
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_CountryPickerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearching() {
    final _$actionInfo = _$_CountryPickerControllerActionController.startAction(
        name: '_CountryPickerController.setSearching');
    try {
      return super.setSearching();
    } finally {
      _$_CountryPickerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setElevation() {
    final _$actionInfo = _$_CountryPickerControllerActionController.startAction(
        name: '_CountryPickerController.setElevation');
    try {
      return super.setElevation();
    } finally {
      _$_CountryPickerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActionIcon() {
    final _$actionInfo = _$_CountryPickerControllerActionController.startAction(
        name: '_CountryPickerController.setActionIcon');
    try {
      return super.setActionIcon();
    } finally {
      _$_CountryPickerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeAppBarTitle(bool searching) {
    final _$actionInfo = _$_CountryPickerControllerActionController.startAction(
        name: '_CountryPickerController.changeAppBarTitle');
    try {
      return super.changeAppBarTitle(searching);
    } finally {
      _$_CountryPickerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchQuery: ${searchQuery},
searching: ${searching},
elevation: ${elevation},
actionIcon: ${actionIcon},
appBarTitle: ${appBarTitle}
    ''';
  }
}
