class WeatherModel {
  final String cityName;
  final String country;
  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final String description;
  final String iconCode;
  final double windSpeed;
  final int cloudiness;

  WeatherModel({
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.description,
    required this.iconCode,
    required this.windSpeed,
    required this.cloudiness,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      country: json['sys']['country'],
      temperature: (json['main']['temp'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      tempMin: (json['main']['temp_min'] as num).toDouble(),
      tempMax: (json['main']['temp_max'] as num).toDouble(),
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      cloudiness: json['clouds']['all'],
    );
  }
}
