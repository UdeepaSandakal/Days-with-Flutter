/*
{
  "weather": [
    {
      "description": "moderate rain",
      "icon": "10d"
    }
  ],

  "main": {
    "temp": 298.48,
    "temp_min": 297.56,
    "temp_max": 300.05,
    "humidity": 64,
  },
  
  "name": "Zocca",
}            
 */

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherResponse {
  final String cityName;

  WeatherResponse({required this.cityName});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    return WeatherResponse(cityName: cityName);
  }
}
