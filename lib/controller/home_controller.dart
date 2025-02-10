import 'package:get/get.dart';

class HomeController extends GetxController{
  List<String> list= ["T1","T4","T8","T5","T3","T2",];

  int counter = 0;

  void Counter (){

    counter = counter+1;
    update();
  }

}