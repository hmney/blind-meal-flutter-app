import 'package:app/src/modules/auth/domain/entities/user.dart';
import 'package:app/src/modules/auth/domain/repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class UserRepositoryImplementation extends UserRepository {
  final firestore = Firestore.instance;
  final analytics = Modular.get<FirebaseAnalytics>();
  CollectionReference get _userCollection => firestore.collection('users');

  // This function responsable for creating a new user in signup
  @override
  Future<void> createNewUserDataToFirebase(User user) async {
    await _userCollection.document(user.id).setData(user.toJson());
  }

  // This function responsable set data to firebase analytics in signup
  @override
  void createNewUserDataToAnalytics(User user) {
    Crashlytics.instance
      ..setUserName(user.username)
      ..setUserIdentifier(user.id);
    analytics.logSignUp(signUpMethod: 'phone');
    analytics.setUserId(user.id);
    analytics.setUserProperty(name: 'username', value: user.username);
    analytics.setUserProperty(name: 'email', value: user.email);
    analytics.setUserProperty(name: 'phone', value: user.phone);
    analytics.setUserProperty(name: 'country', value: user.country);
    analytics.setUserProperty(
        name: 'birthdate', value: user.birthdate.toString());
  }
}
