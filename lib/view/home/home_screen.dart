import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plants_app/controller/home_controller.dart';
import 'package:plants_app/helper/constants.dart';

import '../../main.dart';
import '../../utils/locale/language_viewmodel.dart';
import '../widget/plants_widget.dart';
import '../widget/tabBar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>
      (
      init: HomeController(),
      builder: (homeController)=> SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: 50,
                          width: 50,
                          color: secondaryColor,
                        child: Icon(Icons.account_circle_outlined,color: Colors.white,),
                        ),
                      ),

                      GetBuilder<LanguageController>(
                          init: LanguageController(),
                          builder: (controller) => ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              height: 50,
                              width: 50,
                              color: secondaryColor,
                              child: IconButton(onPressed: () {
                                appLanguage == 'en'? controller.changeLanguageToAR() :controller.changeLanguageToEN() ;
                                Get.updateLocale(Locale(appLanguage));
                              }, icon: Icon(Icons.language,color: Colors.white,)
                              ),
                            ),
                          ),
                      )

                    ],
                  ),

                  SizedBox(height: Get.height*0.05,),
                  Text("lets_go".tr,style: TextStyle(color: secondaryColor ,fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: Get.height*0.03,),
                  TextFormField(
                    // controller: loginController.textControllerEimal,
                    decoration: InputDecoration(
                      // icon: Icon(Icons.account_box),
                      suffixIcon:  Icon(Icons.mic,color: secondaryColor,),
                      prefixIcon:  Icon(Icons.search_rounded,color: secondaryColor,),
                      filled: true, // Enables background color
                      fillColor: primaryColor, // Full green background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                        borderSide: BorderSide.none, // Removes border
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                        borderSide: BorderSide(color: secondaryColor), // Removes border
                      ),
                      hintText: "Enter text",
                      hintStyle: TextStyle(color: Colors.white70), // Hint text color
                    ),
                    onChanged: (value) {

                    },

                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TabBarWidget(title: 'recomnted'.tr,),
                        TabBarWidget(title: 'Top',),
                        TabBarWidget(title: 'test',),
                        TabBarWidget(title: 'test',),
                        TabBarWidget(title: 'test',),
                        TabBarWidget(title: 'test',),
                        TabBarWidget(title: 'test',),
                        TabBarWidget(title: 'test',),
                        TabBarWidget(title: 'test',),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height*0.05,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PlantWidget(image: "assets/images/plant1.png", name: "plant 1" ,price: '80.00 \$'),
                        PlantWidget(image: "assets/images/plant2.png", name: "plant 2" ,price: '70.00 \$'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
