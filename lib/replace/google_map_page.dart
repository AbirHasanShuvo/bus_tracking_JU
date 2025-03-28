import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  final locationController = Location();
  LatLng? currentPosition;
  static const googlePlex = LatLng(23.790152446517805, 90.42536811123523);
  static const mountainView = LatLng(23.877655079643997, 90.26616393821998);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async => await fetchLocationUpdates(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          currentPosition == null
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: googlePlex,
                  zoom: 14.4746,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('currentLocation'),
                    position: currentPosition!,
                    infoWindow: InfoWindow(title: 'Google Plex'),
                  ),
                  const Marker(
                    markerId: MarkerId('sourceLocation'),
                    position: googlePlex,
                    infoWindow: InfoWindow(title: 'Google Plex'),
                  ),
                  const Marker(
                    markerId: MarkerId('destinationLocation'),
                    position: mountainView,
                    infoWindow: InfoWindow(title: 'Montain View'),
                  ),
                },
              ),
    );
  }

  Future<void> fetchLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }
    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationController.onLocationChanged.listen((LocationData currentLocation) {
      // Handle location updates here
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition = LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          );
        });
        print(currentPosition);
      }
    });
  }
}
