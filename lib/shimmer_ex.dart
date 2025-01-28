import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


void main() {
  runApp(MaterialApp(
    home: ShimmerLoadingScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class ShimmerLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shimmer Loading'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerList(); // Shimmer effect while loading
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return YourDataWidget(data: snapshot.data);
          }
        },
      ),
    );
  }
  Future<List<String>> fetchData() async {
    // Simulate data fetching delay
    await Future.delayed(Duration(seconds: 3));
    return Data;
  }
}
List<String> Data =[
  'Item 1', 'Item 2', 'Item 3','Item 4','Item 5','Item 1', 'Item 2', 'Item 3','Item 4','Item 5'
];

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,

      child: ListView.builder(
        itemCount: Data.length, // Adjust the count based on your needs
        itemBuilder: (context, index) {
          return ListTile(
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 50,
                color: Colors.white,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 120,
                color: Colors.white,
              ),
            ),
            leading: Container(
              height: 70,
              width: 70,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}

class YourDataWidget extends StatelessWidget {
  final List<String>? data;

  YourDataWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data!.length,
      itemBuilder: (context, index) {
        return Container(
          // padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2),
          ),
          child: ListTile(
            title: Text(data![index]),
            subtitle: Text("New Item ..."),
            leading: Icon(Icons.add_circle),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            // trailing: ElevatedButton(onPressed: (){}, child: Center(child: Text("Next.."),)),
          ),
        );
      },
    );
  }
}