import 'package:bus_tracking/edu_tv/signin_screen.dart';
import 'package:bus_tracking/home_screen/home_screen.dart';
import 'package:bus_tracking/new_home/new_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MapScreen());
  }
}
