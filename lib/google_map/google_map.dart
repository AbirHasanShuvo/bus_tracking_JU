import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapFlutter extends StatefulWidget {
  const GoogleMapFlutter({super.key});

  @override
  State<GoogleMapFlutter> createState() => _GoogleMapFlutterState();
}

class _GoogleMapFlutterState extends State<GoogleMapFlutter> {
  //23.786330, 90.438077
  LatLng myCurrentLocation = LatLng(23.786330, 90.438077);
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  // BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  // @override
  // void initState() {
  //   customMarker();
  //   super.initState();
  // }

  // void customMarker() {
  //   BitmapDescriptor.asset(
  //     ImageConfiguration(),
  //     "assets/images/busLocation.png",
  //   ).then((value) {
  //     setState(() {
  //       customIcon = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: myCurrentLocation,
          zoom: 14,
        ),
        // markers: {
        //   Marker(
        //     markerId: MarkerId("Mrker Id"),
        //     position: myCurrentLocation,
        //     draggable: true,
        //     onDragEnd: (value) {
        //       print(value);
        //     },
        //     infoWindow: InfoWindow(
        //       title: "My Location",
        //       snippet: "Welcome to my location",
        //     ),
        //     icon: customIcon,
        //   ),
        // },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          Position position = await currentPosition();
          mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 14,
              ),
            ),
          );
          markers.clear();
          markers.add(
            Marker(
              markerId: const MarkerId('This is my location'),
              position: LatLng(position.latitude, position.longitude),
            ),
          );

          setState(() {});
        },
        child: const Icon(Icons.my_location, size: 30),
      ),
    );
  }

  // Future<Position> currentPosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Check if the location service is enabled
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error("Location services are disabled");
  //   }

  //   // Check if permission is granted
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error("Location permission denied");
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error("Location permission denied forever");
  //   }

  //   // Get the current position
  //   Position position = await Geolocator.getCurrentPosition();
  //   return position;
  // }

  Future<Position> currentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if the location service is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Show a message instead of throwing an error
      showError("Please enable location services.");
      return Future.error("Location services are disabled");
    }

    // Check if permission is granted
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showError("Location permission denied.");
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      showError(
        "Location permission permanently denied. Please enable it in settings.",
      );
      return Future.error("Location permission denied forever");
    }

    // Get the current position
    return await Geolocator.getCurrentPosition();
  }

  void showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
