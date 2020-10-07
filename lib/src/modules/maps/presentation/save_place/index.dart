import 'package:app/src/common/buttons/button.dart';
import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/maps/domain/entities/delivery_location.dart';
import 'package:app/src/modules/maps/module.dart';
import 'package:app/src/modules/maps/presentation/additional_informations/controller.dart';
import 'package:app/src/modules/order/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SavePlaceScreen extends StatefulWidget {
  @override
  _SavePlaceScreenState createState() => _SavePlaceScreenState();
}

class _SavePlaceScreenState extends State<SavePlaceScreen> {
  final controller = Modular.get<AdditionalInformationsController>();
  final _formKey = GlobalKey<FormState>();
  DELIVERY_LOCATION_TYPE type;

  @override
  void initState() {
    super.initState();
    type = controller.mapsController.deliveryLocationType;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBar(
          title: Text('Save Place'),
          backgroundColor: AppTheme.primaryColor,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Name',
                        style: TextStyle(
                          color: Color(0xff707070),
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: TextFormField(
                        validator: controller.mapsController.deliveryLocation
                            .validateAddressName,
                        onSaved: (value) => controller.mapsController
                            .deliveryLocation.addressName = value,
                        cursorColor: AppTheme.primaryColor,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                          ),
                          hintText: "e.g. John's Home",
                          hintStyle: TextStyle(
                            color: Color(0xffacacac),
                            fontFamily: 'Roboto',
                            fontSize: 14,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Address',
                        style: TextStyle(
                          color: Color(0xff707070),
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: TextFormField(
                        controller: controller.mapsController
                            .deliveryLocationAddressTextController,
                        cursorColor: AppTheme.primaryColor,
                        readOnly: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                          ),
                          hintStyle: TextStyle(
                            color: Color(0xffacacac),
                            fontFamily: 'Roboto',
                            fontSize: 14,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Button(
                  onPressed: () {
                    _formKey.currentState.save();
                    if (_formKey.currentState.validate()) {
                      controller.mapsController.deliveryLocation.type =
                          DELIVERY_LOCATION_TYPE.OTHER;
                      controller.saveDeliveryLocationForUserInFirebase();
                      if (type == DELIVERY_LOCATION_TYPE.NONE) {
                        controller.mapsController.orderController.order
                                .deliveryLocation =
                            controller.mapsController.deliveryLocation;

                        controller.mapsController.orderController
                            .setDeliveryLocationAddress(controller
                                .mapsController
                                .deliveryLocation
                                .address
                                .addressLine);
                        Modular.to.popUntil(
                            ModalRoute.withName(OrderModule.ORDER_SCREEN));
                      } else {
                        Modular.to.popUntil(ModalRoute.withName(
                            MapsModule.SAVED_PLACES_SCREEN));
                      }
                    }
                  },
                  style: BUTTON_STYLE.SAVE,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
