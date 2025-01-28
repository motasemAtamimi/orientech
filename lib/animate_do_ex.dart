import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() => runApp(const MyApp());
bool isbool = false;
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.light(useMaterial3: true),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

                ElevatedButton(onPressed: () {
              setState(() {});

            }, child: Text("test"),),
             an(),
          ],
        ),
      ),
    );
  }
}

class Square extends StatelessWidget {
  const Square({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.blueAccent,
    );
  }
}
class an extends StatelessWidget {
  const an({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FadeInLeft(child: const Square()),
        FadeInUp(child: const Square()),
        FadeInDown(child: const Square()),
        FadeInRight(child: const Square()),
      ],
    );
  }
}