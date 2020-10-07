import 'package:app/src/common/buttons/button.dart';
import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/maps/domain/entities/delivery_location.dart';
import 'package:app/src/modules/maps/module.dart';
import 'package:app/src/modules/maps/presentation/additional_informations/controller.dart';
import 'package:app/src/modules/order/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AdditionalInformationsScreen extends StatefulWidget {
  @override
  _AdditionalInformationsScreenState createState() =>
      _AdditionalInformationsScreenState();
}

class _AdditionalInformationsScreenState extends ModularState<
    AdditionalInformationsScreen, AdditionalInformationsController> {
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
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBar(
          title: Text('Additional Informations'),
          backgroundColor: AppTheme.primaryColor,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Area*',
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
                              cursorColor: AppTheme.primaryColor,
                              onSaved: (value) => controller.mapsController
                                  .deliveryLocation.areaName = value,
                              validator: controller.mapsController
                                  .deliveryLocation.validateAreaName,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                hintText: "Enter area name",
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
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Street*',
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
                              cursorColor: AppTheme.primaryColor,
                              validator: controller.mapsController
                                  .deliveryLocation.validateStreetName,
                              onSaved: (value) => controller.mapsController
                                  .deliveryLocation.streetName = value,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                hintText: "Enter street name",
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
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Flat/Villa No.*',
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
                              validator: controller.mapsController
                                  .deliveryLocation.validateBuildingNumber,
                              onSaved: (value) => controller.mapsController
                                  .deliveryLocation.buildingNumber = value,
                              cursorColor: AppTheme.primaryColor,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                hintText: "Enter flat or villa number",
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
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Building/Villa*',
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
                              validator: controller.mapsController
                                  .deliveryLocation.validateBuildingName,
                              onSaved: (value) => controller.mapsController
                                  .deliveryLocation.buildingName = value,
                              cursorColor: AppTheme.primaryColor,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                hintText: "Enter building or villa name",
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
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Additional Instructions',
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
                              validator: controller
                                  .mapsController
                                  .deliveryLocation
                                  .validateAdditionalInstructions,
                              onSaved: (value) => controller
                                  .mapsController
                                  .deliveryLocation
                                  .additionalInstructions = value,
                              maxLines: 2,
                              cursorColor: AppTheme.primaryColor,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                hintText: "(Optional)",
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
                      if (type == DELIVERY_LOCATION_TYPE.NONE)
                        Observer(
                          builder: (_) => Row(
                            children: [
                              Checkbox(
                                value: !controller.saveDeliveryLocation,
                                onChanged: controller.setSaveDeliveryLocation,
                                activeColor: AppTheme.primaryColor,
                              ),
                              Text("Don't save"),
                            ],
                          ),
                        ),
                      SizedBox(height: 20),
                      Center(
                        child: Observer(
                          builder: (_) => Button(
                              onPressed: () {
                                _formKey.currentState.save();
                                print(type);
                                if (_formKey.currentState.validate()) {
                                  if ((controller.saveDeliveryLocation &&
                                          type ==
                                              DELIVERY_LOCATION_TYPE.NONE) ||
                                      type == DELIVERY_LOCATION_TYPE.OTHER) {
                                    MapsModule.toSavePlaceScreen();
                                  } else {
                                    if (type == DELIVERY_LOCATION_TYPE.HOME ||
                                        type == DELIVERY_LOCATION_TYPE.WORK) {
                                      controller.mapsController.deliveryLocation
                                              .addressName =
                                          type == DELIVERY_LOCATION_TYPE.HOME
                                              ? 'HOME'
                                              : 'WORK';
                                      controller.mapsController.deliveryLocation
                                          .type = type;
                                      controller
                                          .saveDeliveryLocationForUserInFirebase();
                                    }
                                    if (type == DELIVERY_LOCATION_TYPE.NONE) {
                                      controller.mapsController.orderController
                                              .order.deliveryLocation =
                                          controller
                                              .mapsController.deliveryLocation;
                                      controller.mapsController.orderController
                                          .setDeliveryLocationAddress(controller
                                              .mapsController
                                              .deliveryLocation
                                              .address
                                              .addressLine);
                                      Modular.to.popUntil(ModalRoute.withName(
                                          OrderModule.ORDER_SCREEN));
                                    } else {
                                      Modular.to.popUntil(ModalRoute.withName(
                                          MapsModule.SAVED_PLACES_SCREEN));
                                    }
                                  }
                                }
                              },
                              style: type == DELIVERY_LOCATION_TYPE.WORK ||
                                      type == DELIVERY_LOCATION_TYPE.HOME ||
                                      !controller.saveDeliveryLocation
                                  ? BUTTON_STYLE.DONE
                                  : BUTTON_STYLE.CONTINUE),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
