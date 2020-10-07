import 'package:app/src/common/buttons/button.dart';
import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/maps/domain/entities/delivery_location.dart';
import 'package:app/src/modules/maps/module.dart';
import 'package:app/src/modules/maps/presentation/set_location_on_map.dart/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SetLocationOnMapScreen extends StatefulWidget {
  @override
  _SetLocationOnMapScreenState createState() => _SetLocationOnMapScreenState();
}

class _SetLocationOnMapScreenState
    extends ModularState<SetLocationOnMapScreen, SetLocationOnMapController> {
  DELIVERY_LOCATION_TYPE type;
  @override
  void initState() {
    super.initState();
    type = controller.mapsController.deliveryLocationType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        elevation: 2,
        leading: BackButton(color: Colors.black),
        title: GestureDetector(
          onTap: () => Modular.to.pop(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SET DELIVERY LOCATION',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: controller
                    .mapsController.deliveryLocationAddressTextController,
                readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isCollapsed: true,
                ),
                onTap: () => Modular.to.pop(),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.my_location,
              color: AppTheme.primaryColor,
            ),
            onPressed: () => controller.setInitialDeliveryLocation(
              coordinates: controller.mapsController.currentLocationCoordinates,
            ),
          )
        ],
      ),
      body: Stack(children: <Widget>[
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition:
              controller.mapsController.currentLocationCoordinates != null
                  ? CameraPosition(
                      target: LatLng(
                          controller.mapsController.currentLocationCoordinates
                              .latitude,
                          controller.mapsController.currentLocationCoordinates
                              .longitude),
                      zoom: 15,
                    )
                  : CameraPosition(target: LatLng(0, 0), zoom: 15),
          onCameraMove: controller.setOnMoveLocation,
          onCameraIdle: () {
            if (controller.onMoveLocation != null &&
                !controller.isGoingToCurrentLocation) {
              controller.setDeliveryLocationAddress(
                Coordinates(
                  controller.onMoveLocation.target.latitude,
                  controller.onMoveLocation.target.longitude,
                ),
              );
            }
          },
          onMapCreated: controller.onMapCreated,
          rotateGesturesEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
        ),
        Positioned(
          left: 10,
          right: 10,
          bottom: 20,
          child: Align(
            alignment: Alignment.center,
            child: Button(
              onPressed: () => MapsModule.toAdditionalInformationsScreen(),
              style: BUTTON_STYLE.CONTINUE,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Icon(Icons.place),
        ),
      ]),
    );
  }
}
