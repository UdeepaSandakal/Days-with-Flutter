import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_app/utils/colors.dart';
import 'package:fruit_app/utils/utilis.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: kSecondaryColor,
                    backgroundImage: AssetImage('assets/user.png'),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Udeepa Sandakal',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // icon widget
                  iconWidget(FontAwesomeIcons.bagShopping, true),
                ],
              ),
              const SizedBox(height: 30),

              //tagline
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Get four fresh items \n',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'with',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ' Hey Markets',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              //search bar
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width * 0.55,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: boxShadow,
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Row(
                          children: const [
                            Icon(
                              FontAwesomeIcons.magnifyingGlass,
                              size: 25,
                              color: kPrimaryColor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Search Apple',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          FontAwesomeIcons.filter,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              //category list
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 20.0),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        data[index].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              index == 0 ? FontWeight.bold : FontWeight.w400,
                          color: index == 0 ? kPrimaryColor : Colors.black87,
                        ),
                      ),
                    );
                  },
                ),
              ),

              //product view
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 40,
                ),
                primary: false,
                shrinkWrap: true,
                itemCount: data[0].products!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: ProductWidget(product: data[0].products![index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
