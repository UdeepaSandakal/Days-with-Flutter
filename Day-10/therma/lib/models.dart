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

   "wind": {
    "speed": 0.62,
  },

   "sys": {
    "country": "IT",
  },
  
  "name": "Zocca",
}            
 */

class CountryInfo {
  final String country;

  CountryInfo({required this.country});

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    final country = json['country'];

    return CountryInfo(country: country);
  }
}

class WeatherInfo {
  final String description;
  final String icon;
  final String iconUrl;

  WeatherInfo({
    required this.description,
    required this.icon,
    required this.iconUrl,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    final iconUrl = 'https://openweathermap.org/img/wn/$icon@2x.png';
    return WeatherInfo(
      description: description,
      icon: icon,
      iconUrl: iconUrl,
    );
  }
}

class TemperatureInfo {
  final double temperature;
  final double temperatureMin;
  final double temperatureMax;
  final int humidity;

  TemperatureInfo(
      {required this.temperature,
      required this.temperatureMin,
      required this.temperatureMax,
      required this.humidity});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    final temperatureMin = json['temp_min'];
    final temperatureMax = json['temp_max'];
    final humidity = json['humidity'];

    return TemperatureInfo(
      temperature: temperature,
      temperatureMax: temperatureMax,
      temperatureMin: temperatureMin,
      humidity: humidity,
    );
  }
}

class WindInfo {
  final double windspeed;

  WindInfo({required this.windspeed});

  factory WindInfo.fromJson(Map<String, dynamic> json) {
    final windspeed = json['speed'];

    return WindInfo(
      windspeed: windspeed,
    );
  }
}

class WeatherResponse {
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;
  final WindInfo windInfo;
  final CountryInfo countryInfo;

  WeatherResponse({
    required this.cityName,
    required this.tempInfo,
    required this.weatherInfo,
    required this.windInfo,
    required this.countryInfo,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    final windInfoJson = json['wind'];
    final windInfo = WindInfo.fromJson(windInfoJson);

    final countryInfoJson = json['sys'];
    final countryInfo = CountryInfo.fromJson(countryInfoJson);

    return WeatherResponse(
      cityName: cityName,
      tempInfo: tempInfo,
      weatherInfo: weatherInfo,
      windInfo: windInfo,
      countryInfo: countryInfo,
    );
  }
}
