import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plants_app/view/home/home_screen.dart';

import '../../controller/login_controller.dart';
import '../../helper/constants.dart';
import '../../utils/sharedPreferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GetBuilder<LoginController>
        (
        init: LoginController(),
        builder: (loginController) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcom",style: TextStyle(color: secondaryColor,fontSize: 25),),
              Text("login"),

              TextFormField(
                controller: loginController.textControllerEimal,
                decoration: InputDecoration(
                  // icon: Icon(Icons.account_box),
                  prefixIcon:  Icon(Icons.account_box),
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
              SizedBox(height: Get.height*0.02,),
              TextFormField(
                // obscuringCharacter: ,
                obscureText: loginController.pass1,
                controller: loginController.textControllerPass,
                decoration: InputDecoration(
                  prefixIcon:  Icon(Icons.account_box),
                  suffixIcon: IconButton(icon:loginController.pass1 ?Icon(Icons.remove_red_eye_outlined): Icon(Icons.remove_red_eye),
                    onPressed: () {
                      loginController.pass1 = ! loginController.pass1;
                      loginController.update();
                    },),
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
              SizedBox(height: Get.height*0.02,),
              Row(
                children: [
                  Checkbox(value: loginController.checkValue,
                      onChanged:(value) {
                        loginController.checkValue = !loginController.checkValue;
                        loginController.update();
                        SharedPref.saveBool("saveLogin",loginController.checkValue);

                      },),
                  Text("Remmber me"),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.to(HomeScreen());
                },
                child: Container(
                  width: Get.width*0.8,
                  height: Get.height*0.04,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text("Login",style: TextStyle(color: Colors.white),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
