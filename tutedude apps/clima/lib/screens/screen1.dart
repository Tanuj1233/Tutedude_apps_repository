import 'package:clima/screens/screen2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Screen1 extends StatefulWidget {
  final weatherdata;
  const Screen1({super.key, required this.weatherdata});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  var apikey = '1379e04436ea3004b7e5ae41a56a68be';
  var cityName;
  var currentWeather;
  var tempInCel;
  var emoji = " ";

  @override
  void initState() {
    print(widget.weatherdata['name']);
    updateUI(widget.weatherdata);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/screen1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      print('Pressed');
                      print(widget.weatherdata['weather'][0]['main']);
                      updateUI(widget.weatherdata);
                    },
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () async {
                      var cityName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Screen2()),
                      );
                      print(cityName);
                      if (cityName != Null || cityName != "") {
                        var weatherData = getWeatherDataFromCityName(cityName);
                        setState(() {
                          updateUI(widget.weatherdata);
                        });
                      }
                    },
                  ),
                ],
              ),
              Text(
                cityName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$tempInCel°C",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(emoji, style: TextStyle(fontSize: 70)),
                  Text(
                    currentWeather,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String kalvinToCel(var temp) {
    var tempInCel = temp - 273.15;
    String tempInString = tempInCel.floor().toString();
    return tempInString;
  }

  Future<void> getWeatherDataFromCityName(String cityName) async {
    var cityWeatherAPI =
        "https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}";

    var url = Uri.http('api.openweathermap.org', '/data/2.5/weather', {
      'q': cityName,
      'appid': apikey,
    });
    print(url);
    var response = await http.get(url);
    var data = response.body;
    var weatherData = jsonDecode(data);
    updateUI(weatherData);
  }

  void updateUI(weatherData) {
    var weatherid = weatherData['weather'][0]['id'];
    if (weatherid > 200 && weatherid < 300) {
      setState(() {
        emoji = "🌩️";
      });
    } else if (weatherid > 300 && weatherid < 400) {
      setState(() {
        emoji = "⛈️";
      });
    } else if (weatherid > 500 && weatherid < 600) {
      setState(() {
        emoji = "🌧️";
      });
    } else if (weatherid > 700 && weatherid < 800) {
      setState(() {
        emoji = "🌨️";
      });
    } else if (weatherid >= 800) {
      setState(() {
        emoji = "⛅";
      });
    }

    setState(() {
      var temp = weatherData['main']['temp'];
      tempInCel = kalvinToCel(temp);
      currentWeather = weatherData['weather'][0]['main'];
      cityName = weatherData['name'];
    });
  }
}
