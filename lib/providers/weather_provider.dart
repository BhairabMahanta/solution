import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_services.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? weather;

  Future<void> fetchWeather() async {
    try {
      final weatherData = await WeatherAPI().fetchWeatherData("Guwahati");
      weather = WeatherModel.fromJson(weatherData);
      notifyListeners();
    } catch (e) {
      print("Error fetching weather: $e");
    }
  }
}
