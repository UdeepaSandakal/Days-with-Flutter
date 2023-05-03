import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('keeTube'),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).accentColor,
          child: ButtonBar(
            children: [
              navigationButton(Icons.chevron_left, () {}),
              navigationButton(Icons.chevron_left, () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget navigationButton(IconData icon, Function() onPressed) {
    return IconButton(icon: Icon(icon), onPressed: onPressed);
  }
}
