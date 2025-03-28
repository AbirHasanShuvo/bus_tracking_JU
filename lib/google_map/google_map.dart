import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapFlutter extends StatefulWidget {
  const GoogleMapFlutter({super.key});

  @override
  State<GoogleMapFlutter> createState() => _GoogleMapFlutterState();
}

class _GoogleMapFlutterState extends State<GoogleMapFlutter> {
  //23.786330, 90.438077
  LatLng myCurrentLocation = LatLng(23.786330, 90.438077);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: myCurrentLocation,
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: MarkerId("Mrker Id"),
            position: myCurrentLocation,
            draggable: true,
            onDragEnd: (value) {
              print(value);
            },
            infoWindow: InfoWindow(
              title: "My Location",
              snippet: "Welcome to my location",
            ),
          ),
        },
      ),
    );
  }
}
