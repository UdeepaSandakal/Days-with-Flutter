import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:fruit_app/data/data.dart';
import 'package:fruit_app/utils/utilis.dart';

class NutrientWidget extends StatelessWidget {
  final Product product;
  final int index;

  const NutrientWidget({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: boxShadow,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.nutrients[index][0],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${product.nutrients[index][1]}/5',
                style: TextStyle(
                  color: product.nutrientsColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
