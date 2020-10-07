import 'package:geocoder/geocoder.dart';
import 'package:validators/validators.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
part 'delivery_location.g.dart';

@JsonSerializable()
class DeliveryLocation extends _DeliveryLocation with _$DeliveryLocation {
  DeliveryLocation({
    DELIVERY_LOCATION_TYPE type,
    Address address,
    String addressName,
    String areaName,
    String streetName,
    String buildingNumber,
    String buildingName,
    String additionalInstructions,
  }) : super(
          type: type,
          address: address,
          addressName: addressName,
          areaName: areaName,
          streetName: streetName,
          buildingNumber: buildingNumber,
          buildingName: buildingName,
          additionalInstructions: additionalInstructions,
        );

  factory DeliveryLocation.createNewDeliveryLocation() => DeliveryLocation(
        type: null,
        address: null,
        addressName: '',
        areaName: '',
        streetName: '',
        buildingNumber: '',
        buildingName: '',
        additionalInstructions: '',
      );
  factory DeliveryLocation.fromJson(Map<String, dynamic> json) =>
      _$DeliveryLocationFromJson(json);
  Map<String, dynamic> toJson() => _$DeliveryLocationToJson(this);
}

abstract class _DeliveryLocation with Store {
  _DeliveryLocation({
    this.type,
    this.address,
    this.addressName,
    this.areaName,
    this.streetName,
    this.buildingNumber,
    this.buildingName,
    this.additionalInstructions,
  });

  @observable
  @JsonKey(
    fromJson: _addressFromJson,
    toJson: _addressToJson,
    nullable: true,
    includeIfNull: true,
  )
  Address address;

  @action
  void setAddress(Address value) => address = value;

  @observable
  DELIVERY_LOCATION_TYPE type;

  @action
  void setDeliveryLocationType(DELIVERY_LOCATION_TYPE value) => type = value;

  @observable
  String addressName;

  @action
  String validateAddressName(String value) {
    if (isNull(value) || value.isEmpty) {
      return "Canno't be empty";
    }
    return null;
  }

  @observable
  String areaName;

  @action
  String validateAreaName(String value) {
    if (isNull(value) || value.isEmpty) {
      return "Canno't be empty";
    }
    return null;
  }

  @observable
  String streetName;

  @action
  String validateStreetName(String value) {
    if (isNull(value) || value.isEmpty) {
      return "Canno't be empty";
    }
    return null;
  }

  @observable
  String buildingNumber;

  @action
  String validateBuildingNumber(String value) {
    if (isNull(value) || value.isEmpty) {
      return "Canno't be empty";
    }
    return null;
  }

  @observable
  String buildingName;

  @action
  String validateBuildingName(String value) {
    if (isNull(value) || value.isEmpty) {
      return "Canno't be empty";
    }
    return null;
  }

  @observable
  String additionalInstructions;

  @action
  String validateAdditionalInstructions(String value) {
    if (isNull(value) || value.isEmpty) {
      return "Canno't be empty";
    }
    return null;
  }

  static Address _addressFromJson(json) => Address.fromMap(json);
  static Map _addressToJson(Address address) => address?.toMap();
}

enum DELIVERY_LOCATION_TYPE { WORK, HOME, OTHER, NONE }
