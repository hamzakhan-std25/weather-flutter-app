// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weather_model.dart';

class WeatherService {
  static Future<WeatherModel> fetchWeather(String? city) async {
    if (city == null) {
      city='swabi';
    }
    // final apiKey = dotenv.env['WEATHER_API_KEY'];
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=266d58a5c78bd227eececdcad168f151&units=metric';

    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    return WeatherModel.fromJson(data);
  }
}
