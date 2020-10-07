import 'package:app/src/modules/auth/presentation/controller.dart';
import 'package:app/src/modules/maps/domain/entities/delivery_location.dart';
import 'package:app/src/modules/maps/domain/repository/maps_repository.dart';
import 'package:app/src/modules/maps/presentation/controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class SavedPlacesController = _SavedPlacesController
    with _$SavedPlacesController;

abstract class _SavedPlacesController with Store {
  final mapsRepository = Modular.get<MapsRepository>();
  final authController = Modular.get<AuthController>();
  final mapsController = Modular.get<MapsController>();

  @observable
  ObservableList<DeliveryLocation> deliveryLocations = ObservableList();

  @action
  void setDeliveryLocations(List<DeliveryLocation> value) =>
      deliveryLocations = ObservableList.of(value);

  Future<List<DeliveryLocation>> getAllDeliveryLocations() async {
    final deliveryLocations = await mapsRepository
        .fetchAllDeliveryLocations(authController.currentUser.id);
    setDeliveryLocations(deliveryLocations);
    return deliveryLocations;
  }

  DeliveryLocation getWorkLocation() {
    var index = deliveryLocations
        .indexWhere((element) => element.type == DELIVERY_LOCATION_TYPE.WORK);
    if (index != -1) {
      return deliveryLocations[index];
    }
    return null;
  }

  DeliveryLocation getHomeLocation() {
    var index = deliveryLocations
        .indexWhere((element) => element.type == DELIVERY_LOCATION_TYPE.HOME);
    if (index != -1) {
      return deliveryLocations[index];
    }
    return null;
  }

  List<DeliveryLocation> getOtherLocations() {
    return deliveryLocations
        .where((element) => element.type == DELIVERY_LOCATION_TYPE.OTHER)
        .toList();
  }
}
