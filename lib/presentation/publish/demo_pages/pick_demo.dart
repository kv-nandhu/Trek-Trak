import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:trek_trak/Application/publish/publish_update/ride_publish_bloc.dart';
import 'package:trek_trak/presentation/publish/demo_pages/locations/locations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KeralaLocationsDemo extends StatefulWidget {
  @override
  _KeralaLocationsDemoState createState() => _KeralaLocationsDemoState();
}

class _KeralaLocationsDemoState extends State<KeralaLocationsDemo> {
  Completer<GoogleMapController> _completer = Completer();
  Set<Marker> _markers = {};
  double? currentPickLatitude;
  double? currectPickLongitude;
  List<Map<String, dynamic>> filteredPlaces = [];
  String? selectPickLocation;
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
      currentPickLatitude = locationData.latitude;
      currectPickLongitude = locationData.longitude;
      _markers.add(
        Marker(
          markerId: const MarkerId('current-location'),
          position: LatLng(currentPickLatitude!, currectPickLongitude!),
          infoWindow: InfoWindow(
            title: 'Your Location',
            snippet: '$currentPickLatitude, $currectPickLongitude',
          ),
        ),
      );
    });
  }

  void _onPlaceSelected(Map<String, dynamic> place) {
    setState(() {
      selectPickLocation = place['name'];
      currentPickLatitude = place['lat'];
      currectPickLongitude = place['lng'];
      _searchController.text = selectPickLocation!;
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('selected-location'),
          position: LatLng(currentPickLatitude!, currectPickLongitude!),
          infoWindow: InfoWindow(
            title: selectPickLocation,
            snippet: '$currentPickLatitude, $currectPickLongitude',
          ),
        ),
      );
    });

    _moveCamera(LatLng(currentPickLatitude!, currectPickLongitude!));
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
          title: const Text('Pick-up Location🗺️'),
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
                              onTap: () =>
                                  _onPlaceSelected(filteredPlaces[index]),
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
                 BlocProvider.of<RidePublishBloc>(context).add(
                    PickLocationEvent(
                      pickuplocation: selectPickLocation!,
                      picklatitude: currentPickLatitude.toString(),
                      picklongitude: currectPickLongitude.toString(),
                    ),
                  );
                  Navigator.pop(
                    context,
                    {
                      'pickuplocation': selectPickLocation,
                      'picklatitude': currentPickLatitude.toString(),
                      'picklongitude': currectPickLongitude.toString(),
                    },
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
