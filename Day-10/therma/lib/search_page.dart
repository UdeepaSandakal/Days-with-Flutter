import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cityController = TextEditingController();
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
          child: Column(
            children: <Widget>[
              const Text(
                'Search Whether',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Instanly',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w100,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                // controller: cityController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white70,
                  ),
                  hintText: 'City Name',
                  hintStyle: TextStyle(color: Colors.white70),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.white70,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: MaterialButton(
                  color: Colors.blue,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  onPressed: () {},
                  child: Text('Search'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
