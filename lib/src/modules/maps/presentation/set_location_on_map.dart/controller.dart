import 'dart:async';

import 'package:app/src/modules/maps/presentation/controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class SetLocationOnMapController = _SetLocationOnMapController
    with _$SetLocationOnMapController;

abstract class _SetLocationOnMapController with Store {
  final mapsController = Modular.get<MapsController>();
  Completer<GoogleMapController> mapController = Completer();
  bool isGoingToCurrentLocation = false;

  _SetLocationOnMapController() {
    setInitialDeliveryLocation(
        coordinates: mapsController.currentLocationCoordinates);
  }

  Future<void> setInitialDeliveryLocation({Coordinates coordinates}) async {
    try {
      isGoingToCurrentLocation = true;
      if (coordinates != null) {
        await setDeliveryLocationAddress(coordinates);
      } else {
        if (await isLocationServiceEnabled()) {
          var _currentPosition =
              await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
          await setDeliveryLocationAddress(
            Coordinates(_currentPosition.latitude, _currentPosition.longitude),
          );
        }
      }
      (await mapController.future).animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
              mapsController.deliveryLocation.address.coordinates.latitude,
              mapsController.deliveryLocation.address.coordinates.longitude),
          zoom: 15,
        ),
      ));
      isGoingToCurrentLocation = false;
    } catch (error) {
      print(error);
    }
  }

  Future<void> setDeliveryLocationAddress(Coordinates coordinates) async {
    var address = await getAddressFromCoordinates(coordinates);
    mapsController.deliveryLocationAddressTextController.text =
        address.addressLine;
    mapsController.deliveryLocation.setAddress(address);
  }

  Future<Address> getAddressFromCoordinates(Coordinates coordinates) async {
    try {
      final addresses = await mapsController.geocoding
          .findAddressesFromCoordinates(coordinates);
      return addresses?.first;
    } catch (error) {
      print(error);
      return null;
    }
  }

  @observable
  CameraPosition onMoveLocation;

  @action
  void setOnMoveLocation(CameraPosition position) => onMoveLocation = position;

  void onMapCreated(GoogleMapController controller) {
    if (!mapController.isCompleted) {
      mapController.complete(controller);
    }
  }
}
