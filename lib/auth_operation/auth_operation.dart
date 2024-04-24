import 'package:allevents/routes/pages.dart';
import 'package:allevents/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthOperation {
  static final FirebaseAuth mAuth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      logger.w(googleUser!.displayName);
      Get.offNamed(Pages.initialRoute);
    } on Exception catch (e) {
      logger.e(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      mAuth.signOut();
      Get.offAllNamed(Pages.login);
    } on Exception catch (e) {
      logger.e(e.toString());
    }
  }
}
