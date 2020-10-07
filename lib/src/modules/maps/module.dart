import 'package:app/src/modules/maps/domain/entities/delivery_location.dart';
import 'package:app/src/modules/maps/presentation/additional_informations/controller.dart';
import 'package:app/src/modules/maps/presentation/controller.dart';
import 'package:app/src/modules/maps/presentation/index.dart';
import 'package:app/src/modules/maps/presentation/additional_informations/index.dart';
import 'package:app/src/modules/maps/presentation/save_place/index.dart';
import 'package:app/src/modules/maps/presentation/saved_places/controller.dart';
import 'package:app/src/modules/maps/presentation/saved_places/index.dart';
import 'package:app/src/modules/maps/data/maps_repository_implementation.dart';
import 'package:app/src/modules/maps/presentation/saved_places/widgets/select_saved_places.dart';
import 'package:app/src/modules/maps/presentation/set_location_on_map.dart/controller.dart';
import 'package:app/src/modules/maps/presentation/set_location_on_map.dart/index.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MapsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MapsController()),
        Bind((i) => MapsRepositoryImplementation()),
        Bind((i) => AdditionalInformationsController()),
        Bind((i) => SavedPlacesController()),
        Bind((i) => SetLocationOnMapController())
      ];

  @override
  List<Router> get routers => [
        Router(SAVED_PLACES_SCREEN, child: (_, args) => SavedPlacesScreen()),
        Router(DELIVERY_LOCATION_SCREEN,
            child: (_, args) => DeliveryLocationScreen(
                  type: args.data,
                )),
        Router(ADDITIONAL_INFORMATIONS_SCREEN,
            child: (_, args) => AdditionalInformationsScreen()),
        Router(SAVE_PLACE_SCREEN, child: (_, args) => SavePlaceScreen()),
        Router(SET_LOCATION_ON_MAP,
            child: (_, args) => SetLocationOnMapScreen()),
        Router<DeliveryLocation>(SELECT_SAVED_PLACE_SCREEN,
            child: (_, args) => SelectSavedPlacesScreen()),
      ];

  static const SAVED_PLACES_SCREEN = '/saved_places';
  static Future toSavedPlacesScreen() =>
      Modular.to.pushNamed(SAVED_PLACES_SCREEN);

  static const DELIVERY_LOCATION_SCREEN = '/delivery_location';
  static Future toDeliveryLocationScreen(DELIVERY_LOCATION_TYPE type) =>
      Modular.to.pushNamed(DELIVERY_LOCATION_SCREEN, arguments: type);

  static const ADDITIONAL_INFORMATIONS_SCREEN = '/additional_informations';
  static Future toAdditionalInformationsScreen() =>
      Modular.to.pushNamed(ADDITIONAL_INFORMATIONS_SCREEN);

  static const SAVE_PLACE_SCREEN = '/save_place';
  static Future toSavePlaceScreen() => Modular.to.pushNamed(SAVE_PLACE_SCREEN);

  static const SELECT_SAVED_PLACE_SCREEN = '/select_saved_place';
  static Future<DeliveryLocation> toSelecteSavedPlace() =>
      Modular.to.pushNamed(SELECT_SAVED_PLACE_SCREEN);

  static const SET_LOCATION_ON_MAP = '/set_location_on_map';
  static Future toSetLocationOnMap() =>
      Modular.to.pushNamed(SET_LOCATION_ON_MAP);
}
