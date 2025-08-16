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

  /////////////////////////////////////////////////////

  static Future<String> signInWithGoogle({
    bool isForAccountSelection = false,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      // GoogleSignInAccount
      final google = GoogleSignIn.instance;
      await google.initialize(
        serverClientId:
            "139660408618-irmpu3t8neutkn6n01va365tanova2io.apps.googleusercontent.com",
      ); // required in v7+
      if (isForAccountSelection == true) {
        await google.disconnect();
      }

      final account = await google.authenticate(); // correct method
      final auth = account.authentication;

      final credential = GoogleAuthProvider.credential(idToken: auth.idToken);
      final userCred = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      if (userCred.user != null) {
        prefs.setString('userId', userCred.user!.uid);
        prefs.setString('userName', userCred.user!.displayName!);
      }
      return "signIn-success";
    } on FirebaseAuthException {
      return "firebase-exception";
    } on Exception {
      return "exception";
    }
  }
}
