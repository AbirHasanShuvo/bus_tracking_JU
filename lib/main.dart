import 'package:bus_tracking/google_map/google_map.dart';
import 'package:bus_tracking/replace/google_map_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoogleMapPage(),
    );
  }
}
