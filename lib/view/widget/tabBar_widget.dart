import 'package:flutter/material.dart';

import '../../helper/constants.dart';

class TabBarWidget extends StatefulWidget {
  final String title;
   TabBarWidget({super.key, required this.title});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  bool isCheked = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: InkWell(
        onTap: () {
          setState(() {
            isCheked = !isCheked;
          });
        } ,
        child: Container(
          decoration: BoxDecoration(
              color: isCheked == true ? primaryColor :Colors.transparent,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.title,style: TextStyle(color: secondaryColor),),
          ),
        ),
      ),
    );
  }
}
