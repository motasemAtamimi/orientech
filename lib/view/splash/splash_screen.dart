
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plants_app/utils/sharedPreferences/shared_preferences.dart';

import '../../utils/notification/notification_controller.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

@override
  void initState() {
  NotificationController().firebaseMessaging();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      // backgroundColor: cardColor,
      splashIconSize: Get.width*0.9,
      duration: 1700,
      splash: 'assets/images/logo_app.png',
      nextScreen: LoginScreen(),
      animationDuration: Duration(seconds: 1),
      splashTransition: SplashTransition.fadeTransition,
    );
  }

}
