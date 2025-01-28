import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slidable Example',
      home: Scaffold(
        body: ListView(
          children: [
            Slidable(
              // Specify a key if the Slidable is dismissible.
              key: const ValueKey(0),
              // The start action pane is the one at the left or the top side.

              // The end action pane is the one at the right or the bottom side.
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                    borderRadius: BorderRadius.circular(15),

                    padding: EdgeInsets.symmetric(horizontal: 10),
                    onPressed: (_) => controller.openEndActionPane(),
                    backgroundColor: const Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),


                ],
              ),

              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child: Container(
                  color: Colors.black,
                  child: const ListTile(title: Text('Slide me'))),
            ),

          ],
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}