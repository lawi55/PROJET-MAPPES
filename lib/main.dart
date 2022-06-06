import 'package:currency_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TravelHomePage',
      theme: ThemeData(
        fontFamily: 'Spinnaker',
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}

