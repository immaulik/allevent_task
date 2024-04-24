import 'package:allevents/routes/pages.dart';
import 'package:allevents/utils/custom_snakbar.dart';
import 'package:allevents/utils/enum.dart';
import 'package:allevents/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreenController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> signInWithGoogle() async {
    isLoading(true);
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(credential);
    logger.w(user.user!.displayName);
    showSnackBar(
        title: "Login",
        subTitle: "Login Successfully",
        type: SnackBarType.success);
    isLoading(false);
    Get.offAllNamed(Pages.initialRoute);
  }
}
