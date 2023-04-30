import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double fontsize = 40;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.done,
                style: TextStyle(fontSize: fontsize),
                maxLines: null,
              ),
            ),
            Slider(
                value: fontsize,
                onChanged: (newsize) {
                  setState(() {
                    fontsize = newsize;
                  });
                },
                min: 20,
                max: 200),
          ],
        ),
      ),
    );
  }
}
