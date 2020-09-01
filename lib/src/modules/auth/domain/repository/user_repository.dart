import 'package:app/src/modules/auth/domain/entities/survey.dart';
import 'package:app/src/modules/auth/domain/entities/user.dart';

abstract class UserRepository {
  Future<void> createNewUserDataToFirebase(User user);
  void createNewUserDataToAnalytics(User user);
  Future<User> fetchUserData(String userId);
  Future<void> createNewSurveyToFirebase(String userId, Survey survey);
}
