import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../main.dart';


class LanguageController extends GetxController {


  void  changeLanguageToEN (){
    appLanguage = 'en';
    update();
  }
  void changeLanguageToAR (){
    appLanguage = 'ar';
    update();
  }
}