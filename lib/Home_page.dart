import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.greenAccent,
        appBar:
            AppBar(title: const Text("Test Projcet"), centerTitle: true, actions: [
          IconButton(
            icon: const Icon(
              Icons.account_box,
            ),
            onPressed: () {
              print("Icon");
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.account_box,
            ),
            onPressed: () {
              print("Icon");
            },
          ),
        ]),
        drawer: Drawer(
            width: w * 0.7,
            child: Column(
              children: [
                const Text("Menu"),
                ListTile(
                  onTap: () {
                    print("object");
                  },
                  title: const Text("ListTile"),
                  subtitle: const Text("sub"),
                  leading: const Icon(Icons.add),
                  trailing: const Icon(Icons.access_time),
                ),
                ListTile(
                  onTap: () {
                    print("object2");
                  },
                  title: const Text("ListTile"),
                  subtitle: const Text("sub"),
                  leading: const Icon(Icons.add),
                  trailing: const Icon(Icons.access_time),
                ),
              ],
            )),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.access_time), label: "T1"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.access_time,
                ),
                label: "T2"),
          ],
        ),
        body:  GetBuilder<HomeController>(
            init: HomeController(),
            builder: (homeController) => SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(child: Image.asset("assets/pic1.png")),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Login Details",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.cyan),
                          )),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Your password';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      enabled: true,
                      // maxLength: ,
                    ),
                    TextFormField(
                      decoration:
                      const InputDecoration(label: Text("ttt"), hintText: "ttt"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Your password';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password ?",
                              style: TextStyle(fontSize: 18),
                            )),
                      ),
                    ),
                    const Divider(thickness: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            homeController.Counter();
                            print("=============");
                            print(homeController.counter);
                          },
                          child: const Icon(Icons.add),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        SizedBox(
                          width: 10,
                        ),

                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {

                          if (_formKey.currentState!.validate()) {
                            print("object");

                          }
                        },
                        child:  Text("${homeController.counter.toString()}")),


                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: homeController.list.length,
                        itemBuilder: (BuildContext context, int index) {

                          return Text("${homeController.list[index].toString()}");
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),
        )
      ),
    );
  }
}
