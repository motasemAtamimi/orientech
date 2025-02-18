import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plants_app/helper/constants.dart';

class PlantWidget extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  const PlantWidget({super.key, required this.image, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width*0.5,
      height: 500,
      child: Stack(
        children: [
          Positioned(
            top: 70,
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),),
              height: 180,
              width: 180,

            ),
          ),
          Positioned(
              top: 0,
              bottom: 300,
              left: 0,
              child: Image.asset(image,width: 150,)),
          Positioned(
            top: 200,
            child: Row(
              children: [
                SizedBox(width: 15,),
                Text(name),
                SizedBox(width: 35,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child:   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(price),
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
