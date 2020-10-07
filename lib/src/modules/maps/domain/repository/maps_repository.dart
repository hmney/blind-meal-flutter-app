import 'package:app/src/modules/maps/domain/entities/delivery_location.dart';
import 'package:app/src/modules/order/domain/entities/place_autocomplete.dart';

abstract class MapsRepository {
  Future<List<PlaceAutocomplete>> fetchAddressFromQuery(
      String query, String sessionToken);
  Future<void> saveDeliveryLocationForUserInFirebase(
      String userId, DeliveryLocation deliveryLocation);
  Future<List<DeliveryLocation>> fetchAllDeliveryLocations(String userId);
}
