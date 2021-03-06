import 'package:flutter/material.dart';
import 'package:flutter_weather_app/provider/weather.dart';
import 'package:flutter_weather_app/ui/constants/colors.dart';
import 'package:flutter_weather_app/ui/screens/details_screen/details_screen.dart';
import 'package:flutter_weather_app/ui/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WeatherProvider>(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Weather App",
        theme: ThemeData(
          primaryColor: CustomColors.white,
          fontFamily: "Roboto",
        ),
        home: PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          children: [
            HomeScreen(),
            DetailsScreen(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}