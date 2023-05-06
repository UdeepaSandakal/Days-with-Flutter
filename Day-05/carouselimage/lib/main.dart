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
    'images/img_02.png',
    'images/img_03.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Carousel Slider'),
          ),
          body: Center(
            child: CarouselSlider(
                options: CarouselOptions(autoPlay: true),
                items: _imagepaths.map((imagePath) {
                  return Builder(builder: (context) {
                    return Container(
                        //size of the images are different make it fit
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Image.asset(imagePath));
                  });
                }).toList()),
          ),
        ),
      ),
    );
  }
}
