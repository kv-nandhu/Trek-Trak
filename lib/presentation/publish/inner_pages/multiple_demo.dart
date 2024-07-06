import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class MultiLocation extends StatefulWidget {
  @override
  _MultiLocationState createState() => _MultiLocationState();
}

class _MultiLocationState extends State<MultiLocation> {
  Completer<GoogleMapController> _completer = Completer();
  Set<Marker> _markers = {};
  double? currentLatitude;
  double? currentLongitude;

  // List of Kerala places
  final List<Map<String, dynamic>> places = [
    {'name': 'Kochi', 'lat': 9.9312, 'lng': 76.2673},
    {'name': 'Thiruvananthapuram', 'lat': 8.5241, 'lng': 76.9366},
    {'name': 'Kozhikode', 'lat': 11.2588, 'lng': 75.7804},
    {'name': 'Alappuzha', 'lat': 9.4981, 'lng': 76.3388},
    {'name': 'Thrissur', 'lat': 10.5276, 'lng': 76.2144},
  ];

  List<String> selectedPlaces = [];

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
      currentLatitude = locationData.latitude;
      currentLongitude = locationData.longitude;
      _markers.add(
        Marker(
          markerId: MarkerId('current-location'),
          position: LatLng(currentLatitude!, currentLongitude!),
          infoWindow: InfoWindow(
            title: 'Your Location',
            snippet: '$currentLatitude, $currentLongitude',
          ),
        ),
      );
    });
  }

  void _onPlaceSelected(String placeName) {
    final place = places.firstWhere((place) => place['name'] == placeName);

    setState(() {
      selectedPlaces.add(placeName);
      currentLatitude = place['lat'];
      currentLongitude = place['lng'];
      _markers.add(
        Marker(
          markerId: MarkerId(placeName),
          position: LatLng(currentLatitude!, currentLongitude!),
          infoWindow: InfoWindow(
            title: placeName,
            snippet: '$currentLatitude, $currentLongitude',
          ),
        ),
      );
    });
    _moveCamera(LatLng(currentLatitude!, currentLongitude!));
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
          title: Text('Select Locations in Kerala'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                hint: Text('Select a Place'),
                onChanged: (String? newValue) {
                  if (newValue != null && !selectedPlaces.contains(newValue)) {
                    _onPlaceSelected(newValue);
                  }
                },
                items: places.map<DropdownMenuItem<String>>((Map<String, dynamic> place) {
                  return DropdownMenuItem<String>(
                    value: place['name'],
                    child: Text(place['name']),
                  );
                }).toList(),
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
          ],
        ),
      ),
    );
  }
}
