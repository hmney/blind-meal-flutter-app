import 'package:app/src/modules/auth/domain/entities/survey.dart';
import 'package:app/src/modules/auth/domain/entities/user.dart';

abstract class UserRepository {
  Future<void> createNewUserInFirebase(User user);
  void createNewUserInAnalytics(User user);
  Future<User> fetchUserData(String userId);
  Future<void> createNewSurveyForUserInFirebase(String userId, Survey survey);
}
