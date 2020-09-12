import 'package:app/src/modules/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  @override
  Future<AuthResult> signIn({String email, String password}) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<AuthResult> signUp({String email, String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  @override
  Future<FirebaseUser> getCurrentUser() async =>
      await _firebaseAuth.currentUser();

  @override
  String handleException(e) {
    var message;
    switch (e.code) {
      case "ERROR_INVALID_EMAIL":
        message = "Your email address appears to be malformed.";
        break;
      case "ERROR_WRONG_PASSWORD":
        message = "Your password is wrong.";

        break;
      case "ERROR_USER_NOT_FOUND":
        message = "User with this email doesn't exist.";
        break;
      case "ERROR_USER_DISABLED":
        message = "User with this email has been disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        message = "Too many requests. Try again later.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        message = "Signing in with Email and Password is not enabled.";
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        message =
            "The email has already been registered. Please login or reset your password.";
        break;
      default:
        message = "An undefined Error happened.";
    }
    return message;
  }

  @override
  Future<AuthResult> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await _firebaseAuth.signInWithCredential(credential);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
