import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/maps/domain/entities/delivery_location.dart';
import 'package:app/src/modules/maps/module.dart';
import 'package:app/src/modules/maps/presentation/controller.dart';
import 'package:app/src/modules/order/domain/entities/place_autocomplete.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeliveryLocationScreen extends StatefulWidget {
  final DELIVERY_LOCATION_TYPE type;
  DeliveryLocationScreen({this.type});
  @override
  _DeliveryLocationScreenState createState() => _DeliveryLocationScreenState();
}

class _DeliveryLocationScreenState
    extends ModularState<DeliveryLocationScreen, MapsController>
    with SingleTickerProviderStateMixin {
  DELIVERY_LOCATION_TYPE get type => widget.type;

  @override
  void initState() {
    super.initState();
    controller.deliveryLocation = DeliveryLocation.createNewDeliveryLocation();
    controller.deliveryLocationType = type;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppTheme.backgroundColor,
            elevation: 2,
            leading: BackButton(color: Colors.black),
            title: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus();
                controller.setSearching(true);
              },
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
                    onChanged: controller.setDeliveryLocationSearch,
                    decoration: InputDecoration(
                      hintText: 'Search for area, street name...',
                      hintStyle: TextStyle(
                        color: Color(0xff707070),
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                    onTap: () => controller.setSearching(true),
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
                onPressed: () => MapsModule.toSetLocationOnMap(),
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Observer(
              builder: (_) => Column(
                children: [
                  if (type == DELIVERY_LOCATION_TYPE.NONE &&
                      (!controller.isSearching ||
                          controller.deliveryLocationSearch.trim().isEmpty))
                    ListTile(
                      leading: Container(
                        width: 32,
                        height: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                      title: Text('Saved Places'),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                      onTap: () => MapsModule.toSelecteSavedPlace(),
                    ),
                  if (controller.isSearching &&
                      controller.deliveryLocationSearch.trim().isNotEmpty)
                    Observer(
                      builder: (_) => FutureBuilder<List<PlaceAutocomplete>>(
                        future: controller.getAddressesFromSearchQuery(
                            controller.deliveryLocationSearch, '121234'),
                        builder: (_, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox();
                          } else if (snapshot.hasData) {
                            return ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              separatorBuilder: (_, index) => Divider(),
                              itemBuilder: (_, index) {
                                final data = snapshot.data[index];
                                return ListTile(
                                  onTap: () {
                                    controller.setDeliveryLocationAddress(
                                        data.description);

                                    MapsModule.toAdditionalInformationsScreen();
                                  },
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                  ),
                                  title: Text(
                                    data.description,
                                  ),
                                );
                              },
                            );
                          }
                          return SizedBox();
                        },
                      ),
                    ),
                  if (type == DELIVERY_LOCATION_TYPE.NONE)
                    Divider(
                      thickness: 4,
                      color: Color(0xffEFEFEF),
                    ),
                  ListTile(
                    leading: Container(
                      width: 32,
                      height: 32,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    title: Text('Set location on map'),
                    onTap: () => MapsModule.toSetLocationOnMap(),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
