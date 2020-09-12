import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<AuthResult> signIn({String email, String password});
  Future<AuthResult> signUp({String email, String password});
  Future<void> signOut();
  Future<FirebaseUser> getCurrentUser();
  String handleException(e);
  Future<AuthResult> signInWithGoogle();
}
