import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/maps/domain/entities/delivery_location.dart';
import 'package:app/src/modules/maps/module.dart';
import 'package:app/src/modules/order/presentation/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeliveryLocationWidget extends StatefulWidget {
  @override
  _DeliveryLocationWidgetState createState() => _DeliveryLocationWidgetState();
}

class _DeliveryLocationWidgetState extends State<DeliveryLocationWidget> {
  final controller = Modular.get<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Location',
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
          child: Observer(
            builder: (_) => TextField(
              controller: controller.deliveryLocationAddress,
              onTap: () => MapsModule.toDeliveryLocationScreen(
                DELIVERY_LOCATION_TYPE.NONE,
              ),
              cursorColor: AppTheme.primaryColor,
              readOnly: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: 20.0,
                  right: 10.0,
                ),
                hintText: 'Enter your delivery location',
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
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.white),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.my_location,
                    color: AppTheme.primaryColor,
                  ),
                  onPressed: () => null,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
