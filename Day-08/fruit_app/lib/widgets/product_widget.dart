import 'dart:math';

import 'package:flutter/material.dart';
import '../data/data.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: product.color,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Transform.rotate(
              angle: 2.05 * pi,
              child: Image.asset(
                product.image,
                height: 80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
