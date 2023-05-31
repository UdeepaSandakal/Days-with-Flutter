import 'package:http/http.dart' as http;

class DataService {
  void getWeather(String city) async {
    // https://api.openweathermap.org/data/2.5/weather?lat=57&lon=-2.15&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': 'b642aa685e07d872d67883607508c095'
    };

    final uri =
        Uri.http('api.openweathermap.org', 'data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);
  }
}
