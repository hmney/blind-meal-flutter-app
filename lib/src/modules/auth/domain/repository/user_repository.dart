import 'package:app/src/modules/auth/domain/entities/user.dart';

abstract class UserRepository {
  Future<void> createNewUserDataToFirebase(User user);
  void createNewUserDataToAnalytics(User user);
}
