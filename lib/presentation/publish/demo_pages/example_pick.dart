import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickLocation extends StatefulWidget {
  const PickLocation({Key? key}) : super(key: key);

  @override
  State<PickLocation> createState() => _PickUpLocationsState();
}

class _PickUpLocationsState extends State<PickLocation> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.6844, 73.0479),
    zoom: 14,
  );

  final List<Marker>_marker = [];
 final List<Marker> _list = const [
Marker(markerId: MarkerId('1'),
position: LatLng(33.6844, 73.0479),
infoWindow: InfoWindow(title: "My current location")),
Marker(markerId: MarkerId('2'),
position: LatLng(33.738045,73.084488),
infoWindow: InfoWindow(title: "e-11 sector")),
Marker(markerId: MarkerId('2'),
position: LatLng(33.738045,73.084488),
infoWindow: InfoWindow(title: "e-2 sector")),
];

  @override
void initState(){
  super.initState();
  _marker.addAll(_list);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
