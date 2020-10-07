import 'package:app/src/modules/auth/domain/entities/survey.dart';
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

  // This function responsible to create a new user in signup
  @override
  Future<void> createNewUserInFirebase(User user) async {
    await _userCollection.document(user.id).setData(user.toJson());
  }

  // This function responsible to set data to firebase analytics in signup
  @override
  void createNewUserInAnalytics(User user) {
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

  // This function responsible to get data of a user
  @override
  Future<User> fetchUserData(String userId) async {
    final doc = await _userCollection.document(userId).get();
    return doc.exists && doc.data.isNotEmpty ? User.fromJson(doc.data) : null;
  }

  // This function responsible to set survey data to firestore
  @override
  Future<void> createNewSurveyForUserInFirebase(
      String userId, Survey survey) async {
    await _userCollection.document(userId).updateData({'isSurveyFilled': true});
    await _userCollection
        .document(userId)
        .setData({'survey': survey.toJson()}, merge: true);
  }
}
