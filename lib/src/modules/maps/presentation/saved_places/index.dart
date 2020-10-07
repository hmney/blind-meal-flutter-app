import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/maps/domain/entities/delivery_location.dart';
import 'package:app/src/modules/maps/module.dart';
import 'package:app/src/modules/maps/presentation/saved_places/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SavedPlacesScreen extends StatefulWidget {
  @override
  _SavedPlacesScreenState createState() => _SavedPlacesScreenState();
}

class _SavedPlacesScreenState
    extends ModularState<SavedPlacesScreen, SavedPlacesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text('Saved Places'),
      ),
      body: Observer(
        builder: (_) => FutureBuilder<List<DeliveryLocation>>(
          future: controller.getAllDeliveryLocations(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              var _workLocation = controller.getWorkLocation();
              var _homeLocation = controller.getHomeLocation();
              var _otherLocations = controller.getOtherLocations();
              return SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Favorites',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff707070),
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.home),
                            title: Text(
                                _homeLocation != null ? 'Home' : 'Add Home'),
                            subtitle: _homeLocation != null
                                ? Text(
                                    _homeLocation.address.addressLine,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : null,
                            trailing: _homeLocation != null
                                ? IconButton(
                                    icon: Icon(Icons.more_vert),
                                    onPressed: () => null,
                                  )
                                : null,
                            onTap: () => (_homeLocation == null)
                                ? MapsModule.toDeliveryLocationScreen(
                                    DELIVERY_LOCATION_TYPE.HOME)
                                : null,
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.work),
                            title: Text(
                                _workLocation != null ? 'Work' : 'Add Work'),
                            subtitle: _workLocation != null
                                ? Text(
                                    _workLocation.address.addressLine,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : null,
                            trailing: _workLocation != null
                                ? IconButton(
                                    icon: Icon(Icons.more_vert),
                                    onPressed: () => null,
                                  )
                                : null,
                            onTap: () => _workLocation == null
                                ? MapsModule.toDeliveryLocationScreen(
                                    DELIVERY_LOCATION_TYPE.WORK)
                                : null,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 4,
                      color: Color(0xffEFEFEF),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                          child: Text(
                            'Other Saved Places',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff707070),
                            ),
                          ),
                        ),
                        if (_otherLocations.length == 0)
                          ListTile(
                            title: Text(
                              'Add Saved Place',
                              style: TextStyle(color: AppTheme.primaryColor),
                            ),
                            subtitle: Text(
                                'Get to you favorite delivery location faster'),
                            onTap: () => MapsModule.toDeliveryLocationScreen(
                                DELIVERY_LOCATION_TYPE.OTHER),
                          ),
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _otherLocations.length,
                          separatorBuilder: (_, index) => Divider(),
                          itemBuilder: (_, index) => ListTile(
                            leading: Icon(Icons.star_border),
                            title: Text(_otherLocations[index].addressName),
                            subtitle: Text(
                                _otherLocations[index].address.addressLine),
                            trailing: IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: () => null,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primaryColor,
        onPressed: () =>
            MapsModule.toDeliveryLocationScreen(DELIVERY_LOCATION_TYPE.OTHER),
        child: Icon(Icons.add),
      ),
    );
  }
}
