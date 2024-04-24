import 'package:allevents/routes/pages.dart';
import 'package:allevents/routes/routes.dart';
import 'package:allevents/styles/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyCfQhB0oDrZXEe03lNscu25P_LedF_mtms',
      appId: '1:42134281613:android:912caf8eaffacb085b71c4',
      messagingSenderId: '',
      projectId: 'allevents-89cb4',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Pages.initialRoute,
      title: 'Flutter Demo',
      theme: AppTheme.appTheme,
      getPages: Routes.pages,
    );
  }
}
