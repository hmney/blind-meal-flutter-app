import 'package:app/src/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class CountryPickerController = _CountryPickerController
    with _$CountryPickerController;

abstract class _CountryPickerController with Store {
  @observable
  String searchQuery = '';

  @action
  void setSearchQuery(String value) => searchQuery = value;

  @observable
  bool searching = false;

  @action
  void setSearching() => searching = !searching;

  @observable
  double elevation = 0.0;

  @action
  void setElevation() => elevation = this.searching == false ? 5.0 : 0.0;

  @observable
  Icon actionIcon = Icon(Icons.search);

  @action
  void setActionIcon() => actionIcon =
      this.searching == false ? Icon(Icons.cancel) : Icon(Icons.search);

  @observable
  Widget appBarTitle = Text(
    'Select your country',
    style: TextStyle(color: Colors.black),
  );

  @action
  void changeAppBarTitle(bool searching) {
    final searchController = TextEditingController();
    appBarTitle = searching == false
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: setSearchQuery,
              cursorColor: AppTheme.primaryColor,
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
              ],
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Color(0xffacacac),
                  fontFamily: 'Roboto',
                  fontSize: 14,
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          )
        : Text(
            'Select your country',
            style: TextStyle(color: Colors.black),
          );
    setSearchQuery('');
    setElevation();
    setActionIcon();
    setSearching();
  }
}
