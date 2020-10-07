import 'package:app/src/modules/maps/presentation/saved_places/controller.dart';
import 'package:app/src/modules/order/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SelectSavedPlacesScreen extends StatefulWidget {
  @override
  _SelectSavedPlacesScreenState createState() =>
      _SelectSavedPlacesScreenState();
}

class _SelectSavedPlacesScreenState
    extends ModularState<SelectSavedPlacesScreen, SavedPlacesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Place'),
      ),
      body: FutureBuilder(
        future: controller.getAllDeliveryLocations(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            var _locations = controller.getOtherLocations();
            return SingleChildScrollView(
              physics: ScrollPhysics(),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _locations.length,
                separatorBuilder: (_, index) => Divider(),
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: Icon(Icons.star),
                    title: Text(_locations[index].addressName),
                    subtitle: Text(_locations[index].address.addressLine),
                    onTap: () {
                      controller.mapsController.orderController.order
                              .deliveryLocation =
                          controller.mapsController.deliveryLocation;
                      controller.mapsController.orderController
                          .setDeliveryLocationAddress(controller.mapsController
                              .deliveryLocation.address.addressLine);
                      Modular.to.popUntil(
                          ModalRoute.withName(OrderModule.ORDER_SCREEN));
                    },
                  );
                },
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
