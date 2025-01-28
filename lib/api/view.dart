import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ApiController>(
            builder: (_, controller, __) {
                return Center(child: TextButton(child: Text("123"),onPressed: () {
                  controller.getVacationInfo();
                },));
              },
          )
        ],
      ),
    );
  }
}
