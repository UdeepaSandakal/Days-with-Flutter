import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruit_app/screens/home_screen.dart';
import 'package:fruit_app/utils/colors.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'HEY MARKETS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  letterSpacing: 0.1,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'First online',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Market',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Our market always provides fresh items from local farmers. Let\'s support local with us!',
                style: TextStyle(
                  color: Colors.black,
                  height: 1.4,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/bg.png'),
              ),
              const Spacer(),
              Center(
                child: SlideAction(
                  outerColor: kPrimaryColor,
                  sliderButtonIcon: const Icon(
                    FontAwesomeIcons.arrowRight,
                    size: 20,
                    color: kPrimaryColor,
                  ),
                  text: "SWIPE TO START",
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  onSubmit: () {
                    Timer(
                      const Duration(milliseconds: 500),
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'HOW TO SUPPORT ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      TextSpan(
                        text: 'LOCAL FARMERS',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
