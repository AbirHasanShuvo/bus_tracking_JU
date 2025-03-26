import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final locationController = Location();

  static const googlePlex = LatLng(23.778208129456246, 90.3968216098055);

  static const mountainView = LatLng(23.879148614821965, 90.26968114886782);

  LatLng? currentPosition;

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
              ? Center(child: CircularProgressIndicator())
              : GoogleMap(
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: googlePlex,
                  zoom: 10,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('currentLocation'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: currentPosition!,
                  ),

                  const Marker(
                    markerId: MarkerId('sourceLocation'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: googlePlex,
                  ),
                  const Marker(
                    markerId: MarkerId('destinationLocation'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: mountainView,
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
    locationController.onLocationChanged.listen((currentlocation) {
      if (currentlocation.latitude != null &&
          currentlocation.longitude != null) {
        setState(() {
          currentPosition = LatLng(
            currentlocation.latitude!,
            currentlocation.longitude!,
          );
        });
        print(currentPosition);
      }
    });
  }
}
