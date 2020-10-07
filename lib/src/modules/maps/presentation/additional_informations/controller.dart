import 'package:app/src/modules/auth/presentation/controller.dart';
import 'package:app/src/modules/maps/domain/repository/maps_repository.dart';
import 'package:app/src/modules/maps/presentation/controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class AdditionalInformationsController = _AdditionalInformationsController
    with _$AdditionalInformationsController;

abstract class _AdditionalInformationsController with Store {
  final authController = Modular.get<AuthController>();
  final mapsRepository = Modular.get<MapsRepository>();
  final mapsController = Modular.get<MapsController>();

  @observable
  bool saveDeliveryLocation = true;

  @action
  void setSaveDeliveryLocation(bool value) {
    saveDeliveryLocation = !value;
    print(saveDeliveryLocation);
  }

  void saveDeliveryLocationForUserInFirebase() {
    mapsRepository.saveDeliveryLocationForUserInFirebase(
      authController.currentUser.id,
      mapsController.deliveryLocation,
    );
  }
}
