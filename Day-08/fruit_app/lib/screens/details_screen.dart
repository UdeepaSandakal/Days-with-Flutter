import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_app/data/data.dart';
import 'package:fruit_app/utils/colors.dart';
import 'package:fruit_app/utils/utilis.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../widgets/nutrient_widget.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  //for item counting
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //product image
          Container(
            height: size.height * 0.60,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20.0),
            color: widget.product.color,
            child: Transform.rotate(
              angle: 2.20 * pi,
              child: Image.asset(
                widget.product.image,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),

          //top buttons
          Positioned(
            top: 50,
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
            margin: EdgeInsets.only(top: size.height * 0.60),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: size.height * 0.80,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //product name
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            priceWidget(widget.product.price),
                          ],
                        ),

                        //icons
                        Container(
                          width: 130,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: boxShadow,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //decrese quantity icon
                              quantityIcon(
                                onTap: () {},
                                color: kSecondaryColor,
                                icon: FontAwesomeIcons.minus,
                              ),

                              //item count
                              Text(
                                itemCount.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              //increse quantity icon
                              quantityIcon(
                                onTap: () {},
                                color: kPrimaryColor,
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //Netrients details
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.6,
                      ),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return NutrientWidget(
                          product: data[0].products![index],
                          index: index,
                        );
                      },
                    ),

                    //product description
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SlideAction(
                          outerColor: kPrimaryColor,
                          sliderButtonIcon: const Icon(
                            FontAwesomeIcons.arrowRight,
                            size: 20,
                            color: kPrimaryColor,
                          ),
                          text: "ADD TO CART",
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          onSubmit: () {},
                        ),
                      ),
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

  Widget quantityIcon({
    required VoidCallback onTap,
    required Color color,
    required IconData icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(
          icon,
          color: color == kPrimaryColor ? Colors.white : kPrimaryColor,
          size: 20,
        ),
      ),
    );
  }
}
