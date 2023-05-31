import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:therma/data_service.dart';

import 'models.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _cityTextController = TextEditingController();

  final _dataService = DataService();

  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Therma',
      theme: ThemeData.dark(),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Search Weather",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const Text(
                "Instanly",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w200,
                    color: Colors.white70),
              ),
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

              //display outputs

              if (_response != null)
                Column(
                  children: [
                    Text(
                      '${_response?.tempInfo.temperature.round()} °C',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                    ),
                    Text(_response!.weatherInfo.description),
                  ],
                ),

              Container(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _cityTextController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white70,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.white70,
                                style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.blue, style: BorderStyle.solid)),
                        hintText: "City Name",
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: MaterialButton(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        onPressed: _search,
                        color: Colors.lightBlue,
                        child: const Text(
                          "Search",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}
