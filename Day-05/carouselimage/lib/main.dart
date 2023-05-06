import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const CaroselImage());
}

class CaroselImage extends StatefulWidget {
  const CaroselImage({super.key});

  @override
  State<CaroselImage> createState() => _CaroselImageState();
}

class _CaroselImageState extends State<CaroselImage> {
  final _imagepaths = [
    'images/img_01.png',
    'images/img_02.jpg',
    'images/img_03.png',
    'images/img_04.jpg',
    'images/img_05.png'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Carousel Slider'),
          ),
          body: CarouselSlider(
              options: CarouselOptions(autoPlay: true),
              items: _imagepaths.map((imagePath) {
                return Image.asset(imagePath);
              }).toList()),
        ),
      ),
    );
  }
}
