import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FirebaseAuthUtil {
  static Future<String?> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      var user = credential.user;
      if (user != null) {
        user.updateDisplayName(name);
        prefs.setString('userId', user.uid);
        prefs.setString('userName', name);
        prefs.setString('userEmail', email);
        return 'success';
      }
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return 'unexpected';
    }
    return 'unexpected';
  }

  static Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
        .authenticate();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential user = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );
    log(user.toString());
  }

  static Future<String?> signInUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      var user = credential.user;
      if (user != null) {
        prefs.setString('userId', user.uid);
        prefs.setString('userName', user.displayName!);
        prefs.setString('userEmail', email);
        return 'success';
      }
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return 'unexpected';
    }
    return 'unexpected';
  }
}
