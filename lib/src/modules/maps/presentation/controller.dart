import 'dart:async';

import 'package:app/src/modules/maps/domain/entities/delivery_location.dart';
import 'package:app/src/modules/order/domain/entities/place_autocomplete.dart';
import 'package:app/src/modules/maps/domain/repository/maps_repository.dart';
import 'package:app/src/modules/order/presentation/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:geocoder/geocoder.dart';

part 'controller.g.dart';

class MapsController = _MapsController with _$MapsController;

abstract class _MapsController with Store {
  Coordinates currentLocationCoordinates;
  final geocoding = Geocoder.google("AIzaSyC-zB37w_llLO7NGxxbI825h6_SYf3JA_4");
  final googleMapsRepository = Modular.get<MapsRepository>();
  final orderController = Modular.get<OrderController>();
  final deliveryLocationAddressTextController = TextEditingController();
  DELIVERY_LOCATION_TYPE deliveryLocationType;

  _MapsController({this.currentLocationCoordinates}) {
    if (currentLocationCoordinates == null) getCurrentLocation();
  }

  void getCurrentLocation() async {
    var _currentPosition =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentLocationCoordinates =
        Coordinates(_currentPosition.latitude, _currentPosition.longitude);
  }

  @observable
  DeliveryLocation deliveryLocation;

  void setDeliveryLocationAddress(String query) async {
    var address = await getAddressFromQuery(query);
    deliveryLocationAddressTextController.text = address.addressLine;
    deliveryLocation.setAddress(address);
  }

  Future<Address> getAddressFromQuery(String query) async {
    try {
      final coordinates = await geocoding.findAddressesFromQuery(query);
      return coordinates?.first;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<List<PlaceAutocomplete>> getAddressesFromSearchQuery(
      String query, String sessionToken) async {
    return googleMapsRepository.fetchAddressFromQuery(query, sessionToken);
  }

  // This part is responsible to search the delivery location from text field
  @observable
  bool isSearching = false;

  @action
  void setSearching(bool value) => isSearching = value;

  @observable
  String deliveryLocationSearch = '';

  @action
  void setDeliveryLocationSearch(String value) {
    deliveryLocationSearch = value;
  }
}
