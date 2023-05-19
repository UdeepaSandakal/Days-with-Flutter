import 'package:flutter/material.dart';
import 'package:fruit_app/utils/colors.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
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
                  'Our market always provide fresh items from the local farmers, let\'s support local with us!',
                  style: TextStyle(
                    color: Colors.black,
                    height: 1.4,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/bg.png'),
                )
              ],
            )),
      ),
    );
  }
}
