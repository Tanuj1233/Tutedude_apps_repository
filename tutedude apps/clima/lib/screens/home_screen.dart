import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import 'package:clima/screens/screen1.dart';
import 'package:clima/services/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    if (mounted) {
      getLocation();
    }
    super.initState();
    // Optional: you can call getLocation() automatically here
    // getLocation();
  }

  void getLocation() async {
    Location location = Location();
    final loc = await location.getCurrentLocation();
    double lat = loc[0];
    double lon = loc[1];
    print("Latitude: $lat, Longitude: $lon");

    var apiKey = '1379e04436ea3004b7e5ae41a56a68be';
    var url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey',
    );
    print(url);

    print("Requesting: $url");

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print("Response: ${response.body}");
        var data = jsonDecode(response.body);
        print("Weather Data: $data");

        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Screen1(
              weatherdata: data,
            )),
          );
        }
      } else {
        print('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching location or weather: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitDoubleBounce(color: Colors.grey, size: 50.0)),
    );
  }
}
