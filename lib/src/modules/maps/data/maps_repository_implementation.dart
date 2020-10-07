import 'dart:convert';

import 'package:app/src/modules/maps/domain/entities/delivery_location.dart';
import 'package:app/src/modules/order/domain/entities/place_autocomplete.dart';
import 'package:app/src/modules/maps/domain/repository/maps_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';

class MapsRepositoryImplementation extends MapsRepository {
  final client = Client();

  MapsRepositoryImplementation();

  static final String key = 'AIzaSyC-zB37w_llLO7NGxxbI825h6_SYf3JA_4';
  final _firestore = Firestore.instance;
  CollectionReference _deliveryLocationsCollection(String userId) =>
      _firestore.collection('users/$userId/delivery_locations');

  @override
  Future<List<PlaceAutocomplete>> fetchAddressFromQuery(
      String query, String sessionToken) async {
    try {
      final request =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&types=address&key=$key&sessiontoken=$sessionToken';
      final response = await client.get(request);

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['status'] == 'OK') {
          return result['predictions']
              .map<PlaceAutocomplete>(
                  (p) => PlaceAutocomplete(p['place_id'], p['description']))
              .toList();
        }
        if (result['status'] == 'ZERO_RESULTS') {
          return [];
        }
        throw Exception(result['error_message']);
      } else {
        throw Exception('Failed to fetch suggestion');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> saveDeliveryLocationForUserInFirebase(
      String userId, DeliveryLocation deliveryLocation) async {
    await _deliveryLocationsCollection(userId).add(deliveryLocation.toJson());
  }

  @override
  Future<List<DeliveryLocation>> fetchAllDeliveryLocations(
      String userId) async {
    return (await _deliveryLocationsCollection(userId).getDocuments())
        .documents
        .map((element) => DeliveryLocation.fromJson(element.data))
        .toList();
  }
}
