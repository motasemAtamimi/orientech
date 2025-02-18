import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plants_app/utils/locale/locale.dart';
import 'package:plants_app/view/splash/splash_screen.dart';

import 'firebase_options.dart';


String appLanguage = 'en';
String fireBaseToken = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Plants App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'cairo',
      ),
      locale: Locale(appLanguage),
      translations: MyLocale(),

      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
