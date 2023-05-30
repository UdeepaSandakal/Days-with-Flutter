import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Container(
            height: 300,
            width: 300,
            child: const FlareActor(
              "assets/WorldSpin.flr",
              fit: BoxFit.contain,
              animation: "roll",
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: const Column(
            children: <Widget>[
              Text(
                'Search Whether',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Instanly',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w100,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 20),
              TextField()
            ],
          ),
        ),
      ],
    );
  }
}
