import 'package:allevents/modules/login/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.isLoading.isFalse
              ? ElevatedButton(
                  child: Text("Login with Google"),
                  onPressed: () => controller.signInWithGoogle(),
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
