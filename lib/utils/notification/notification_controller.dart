import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../main.dart';


class NotificationController extends GetxController{
  var fbm = FirebaseMessaging.instance;

  // List<NotifyData> notifyData=[];
  List reversData = [];

  // fetchNotification() async {
  //   await NotificationRepository().getNotification
  //     ().then((value) {
  //     notifyData = value.data??[];
  //     reversData=  notifyData.reversed.toList();
  //     update();
  //   });
  //   update();
  // }

  firebaseMessaging() async {
    // print token
    fbm.getToken().then((token){
      print("========================================================");
      print("tokenFirebase : $token");
      fireBaseToken = token!;
      print("=================================");
    });

    /// Foreground Message
    FirebaseMessaging.onMessage.listen((message) {
      print("============foregroundMessage==============");
      print("Title : ${message.notification!.body}");
      // fetchNotification();
      // Get.to(NotificationScreen());
    });

    /// Background Message
    FirebaseMessaging.onMessageOpenedApp.listen((message) {

      print("============BackgroundMessage==============");
      print("Title : ${message.notification!.body}");
      // fetchNotification();
      // Get.to(NotificationScreen());
    });

    /// Terminated
    var initMessage = await FirebaseMessaging.instance.getInitialMessage();
    if(initMessage != null){

      // Get.to(NotificationScreen());
    }
  }
  /// for ios permissions
  requestingPermissions() async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  @override
  onInit() {
    // fetchNotification();
    requestingPermissions();
    firebaseMessaging();
    update();
    super.onInit();
  }

}