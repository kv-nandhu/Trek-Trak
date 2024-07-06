import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DropkeralaLocation extends StatefulWidget {
  @override
  _DropkeralaLocationState createState() => _DropkeralaLocationState();
}

class _DropkeralaLocationState extends State<DropkeralaLocation> {
  Completer<GoogleMapController> _completer = Completer();
  Set<Marker> _markers = {};
  double? currentDropLatitude;
  double? currentDropLongitude;

  // List of Kerala places
  final List<Map<String, dynamic>> places = [
    {'name': 'Kochi', 'lat': 9.9312, 'lng': 76.2673},
    {'name': 'Thiruvananthapuram', 'lat': 8.5241, 'lng': 76.9366},
    {'name': 'Kozhikode', 'lat': 11.2588, 'lng': 75.7804},
    {'name': 'Alappuzha', 'lat': 9.4981, 'lng': 76.3388},
    {'name': 'Thrissur', 'lat': 10.5276, 'lng': 76.2144},
  ];

  String? selectedDropPlace;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    Location location = Location();
    LocationData locationData;

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    setState(() {
      currentDropLatitude = locationData.latitude;
      currentDropLongitude = locationData.longitude;
      _markers.add(
        Marker(
          markerId: MarkerId('current-location'),
          position: LatLng(currentDropLatitude!, currentDropLongitude!),
          infoWindow: InfoWindow(
            title: 'Your Location',
            snippet: '$currentDropLatitude, $currentDropLongitude',
          ),
        ),
      );
    });
  }

  void _onPlaceSelected(Map<String, dynamic> place) {
    setState(() {
      selectedDropPlace = place['name'];
      currentDropLatitude = place['lat'];
      currentDropLongitude = place['lng'];
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('selected-location'),
          position: LatLng(currentDropLatitude!, currentDropLongitude!),
          infoWindow: InfoWindow(
            title: selectedDropPlace,
            snippet: '$currentDropLatitude, $currentDropLongitude',
          ),
        ),
      );
    });

    _moveCamera(LatLng(currentDropLatitude!, currentDropLongitude!));
  }

  Future<void> _moveCamera(LatLng position) async {
    final GoogleMapController controller = await _completer.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: position,
        zoom: 14,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select a Drop-off Location in Kerala'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                hint: Text('Select a Place'),
                value: selectedDropPlace,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    _onPlaceSelected(
                      places.firstWhere((place) => place['name'] == newValue),
                    );
                  }
                },
                items: places.map<DropdownMenuItem<String>>(
                  (Map<String, dynamic> place) {
                    return DropdownMenuItem<String>(
                      value: place['name'],
                      child: Text(place['name']),
                    );
                  },
                ).toList(),
              ),
            ),
            Expanded(
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  _completer.complete(controller);
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(10.8505, 76.2711), // Center of Kerala
                  zoom: 8,
                ),
                markers: _markers,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    {
                      'droplocation': selectedDropPlace,
                      'droplatitude': currentDropLatitude.toString(),
                      'droplongitude': currentDropLongitude.toString(),
                    },
                  );
                },
                child: Text('Confirm Location'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
