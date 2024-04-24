import 'package:allevents/auth_operation/auth_operation.dart';
import 'package:allevents/routes/pages.dart';
import 'package:allevents/routes/routes.dart';
import 'package:allevents/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  checkUser() async {
    await 1.delay();
    FirebaseAuth.instance.authStateChanges().listen((event) {
      logger.w("user = ${event}");
      if (event != null) {
        Get.offAllNamed(Pages.mainScreen);
      } else {
        Get.offAllNamed(Pages.login);
      }
    });
  }

  @override
  void initState() {
    checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
