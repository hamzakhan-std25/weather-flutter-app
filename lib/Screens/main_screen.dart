import 'package:flutter/material.dart';
import 'package:weather_app/Screens/weather_model.dart';
import 'package:weather_app/Screens/weather_services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  WeatherModel? weatherData;
  bool isExpanded = false;
  // list for all city to check weather for.
  final List<String> cities = [
 'Bangkok',
  'Beijing',
  'Berlin',
  'Buenos Aires',
  'Cairo',
  'Chicago',
  'Delhi',
  'Dubai',
  'Islamabad',
  'Istanbul',
  'Jakarta',
  'Johannesburg',
  'Karachi',
  'Kuala Lumpur',
  'Lahore',
  'London',
  'Los Angeles',
  'Madrid',
  'Mexico City',
  'Moscow',
  'Nairobi',
  'New York',
  'Paris',
  'Rome',
  'San Francisco',
  'São Paulo',
  'Seoul',
  'Singapore',
  'Swabi',
  'Sydney',
  'Tokyo',
  'Toronto'
  ];

  fetchWeatherData(String? city) async {
    WeatherModel data = await WeatherService.fetchWeather(city);

    setState(() {
      weatherData = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchWeatherData('Swabi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[300]!, Colors.blue[500]!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: weatherData == null ? CircularProgressIndicator():
           Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    weatherData!.cityName,
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  DropdownButton<String>(
                    dropdownColor: Colors.blue,
                    menuMaxHeight: 300,
                    value: weatherData!.cityName,
                    icon: const Icon(Icons.location_on, color: Colors.white),
                    elevation: 16,
                    style: const TextStyle(
                        fontFamily: AutofillHints.location,
                        color: Colors.white),
                    onChanged: (String? val) {
                      setState(() {
                        fetchWeatherData(val); //
                      });
                    },
                    items: cities.map<DropdownMenuItem<String>>((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(
                          city,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                       weatherData!.temperature.toString(),
                        style: TextStyle(fontSize: 80, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        weatherData!.description,
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                
                ],
              ),
              SizedBox(height: 40),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WeatherDetailRow('Humidity', weatherData!.humidity.toString(), Icons.water),
                      WeatherDetailRow('Wind Speed', weatherData!.windSpeed.toString(), Icons.air),
                      WeatherDetailRow('Pressure', weatherData!.pressure.toString(), Icons.compress),
                      ElevatedButton(
                        onPressed: () {
                          // Action for button
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 217, 248, 133),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'View Details',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  WeatherDetailRow(this.label, this.value, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
