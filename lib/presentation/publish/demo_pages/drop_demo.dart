import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:trek_trak/presentation/publish/demo_pages/locations/locations.dart';

class DropkeralaLocation extends StatefulWidget {
  @override
  _DropkeralaLocationState createState() => _DropkeralaLocationState();
}

class _DropkeralaLocationState extends State<DropkeralaLocation> {
  Completer<GoogleMapController> _completer = Completer();
  Set<Marker> _markers = {};
  double? currentDropLatitude;
  double? currentDropLongitude;
  List<Map<String, dynamic>> filteredPlaces = [];

  // List of Kerala places


  String? selectedDropPlace;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      filteredPlaces = _getSuggestions(_searchController.text);
    });
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
          markerId: const MarkerId('current-location'),
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
      _searchController.text = selectedDropPlace!;
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('selected-location'),
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

  List<Map<String, dynamic>> _getSuggestions(String query) {
    List<Map<String, dynamic>> matches = [];
    for (var place in Locations().places) {
      if (place['name'].toLowerCase().contains(query.toLowerCase())) {
        matches.add(place);
      }
    }
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Drop-it Location🗺️'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Search for a place',
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      _completer.complete(controller);
                    },
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(10.8505, 76.2711), // Center of Kerala
                      zoom: 8,
                    ),
                    markers: _markers,
                  ),
                  if (_searchController.text.isNotEmpty)
                    Positioned(
                      top: 60,
                      left: 8,
                      right: 8,
                      child: Material(
                        elevation: 4,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: filteredPlaces.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(filteredPlaces[index]['name']),
                              onTap: () => _onPlaceSelected(filteredPlaces[index]),
                            );
                          },
                        ),
                      ),
                    ),
                ],
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
                    }
                  );
                },
                child: const Text('Confirm Location'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
