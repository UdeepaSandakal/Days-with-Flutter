import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:fruit_app/screens/intro_screen.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => const MyApp(),
      ),
    );

// void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: "FruitShop",
      home: const IntroScreen(),
    );
  }
}
