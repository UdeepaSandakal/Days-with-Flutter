import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_app/data/data.dart';
import 'package:fruit_app/utils/utilis.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //product image
          Container(
            height: size.height * 0.55,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20.0),
            color: widget.product.color,
            child: Transform.rotate(
              angle: 2.10 * pi,
              child: Image.asset(widget.product.image),
            ),
          ),

          //top buttons
          Positioned(
            top: 70,
            right: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: iconWidget(FontAwesomeIcons.arrowLeft, false),
                ),
                const Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: iconWidget(FontAwesomeIcons.bagShopping, true),
                ),
              ],
            ),
          ),

          //product details
          Container(
            width: size.width,
            margin: EdgeInsets.only(top: size.height * 0.55),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: size.height * 0.55,
                child: Column(
                  children: [
                    Row(
                      children: [
                        //product name
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 35,
                              ),
                            ),
                            const SizedBox(height: 10),
                            priceWidget(widget.product.price),
                          ],
                        ),
                        Container()
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
