import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trek_trak/Application/publish/google_maps/google_map_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:geocoding/geocoding.dart';
class PickUpLocation extends StatefulWidget {
  const PickUpLocation({Key? key});

  @override
  State<PickUpLocation> createState() => _PickUpLocationState();
}

class _PickUpLocationState extends State<PickUpLocation> {
  final locationController = TextEditingController();
  final searchLocationcontroller = TextEditingController();
  List<Marker> _markers = [];
  CameraPosition _initialCameraPosition = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 14,
  );
  Completer<GoogleMapController> _completer = Completer();
  double? currentLatitude;
  double? currentLongitude;

  @override
  void initState() {
    super.initState();
  }

  dynamic first;

  void updateLocationDisplay() {
    setState(() {
      // This triggers the UI to rebuild with the updated location
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: CustomColor.greenColor(),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                ),
                child: Center(
                  child: InkWell(
                    child: const Text(
                      'CONFIRM',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      if (currentLatitude != null && currentLongitude != null) {
                        // Handle confirmation logic here
                      } else {
                        print("Location not selected.");
                      }
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.white54),
                        BoxShadow(color: Colors.black12),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            "Delivery To",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "You selected Location show Here",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 350,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black, width: 2),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 30,
                                  child: Text(
                                    searchLocationcontroller.text.isEmpty
                                        ? "No location selected"
                                        : searchLocationcontroller.text,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 212, 209, 209),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
            Positioned(
              top: 0,
              bottom: 190,
              left: 0,
              right: 0,
              child: BlocBuilder<GoogleMapBloc, GoogleMapState>(
                builder: (context, state) {
                  return GoogleMap(
                    initialCameraPosition: _initialCameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _completer.complete(controller);
                    },
                    markers: Set<Marker>.of(_markers),
                    onTap: (LatLng position) {
                      setState(() {
                        _markers.clear();
                        _markers.add(Marker(
                          markerId: MarkerId('selected_location'),
                          position: position,
                        ));
                        currentLatitude = position.latitude;
                        currentLongitude = position.longitude;
                      });
                    },
                  );
                },
              ),
            ),
            Positioned(
              top: 38,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onChanged: (value) {
                    context.read<GoogleMapBloc>().add(AuthoCompleteLoadedEvent(serachInput: value));
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    hintText: "Search Location",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColor.greenColor()),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintStyle: const TextStyle(fontSize: 14),
                    prefixIcon: const Icon(Icons.search, size: 22, color: Colors.black),
                  ),
                  controller: searchLocationcontroller,
                ),
              ),
            ),
            BlocBuilder<GoogleMapBloc, GoogleMapState>(
              builder: (context, state) {
                if (state is AuthoCompleteLoading) {
                  return const SizedBox();
                } else if (state is AuthoCompleteLoaded) {
                  return Positioned(
                    top: 100,
                    left: 20,
                    right: 20,
                    child: Container(
                      color: state.authocomplete.isEmpty
                          ? Colors.transparent
                          : searchLocationcontroller.text.isEmpty
                              ? Colors.transparent
                              : Colors.white,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.authocomplete.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () async {
                              searchLocationcontroller.text = state.authocomplete[index]['description'];
                             List<Location> locations = await locationFromAddress(state.authocomplete[index]['description']);

                              setState(() {
                                currentLatitude =locations.last.latitude.toDouble();
                                currentLongitude = locations.last.longitude.toDouble();
                                _markers.clear();
                                _markers.add(Marker(
                                  markerId: MarkerId('1'),
                                  position: LatLng(currentLatitude!, currentLongitude!),
                                  infoWindow: InfoWindow(title: 'Searched Location'),
                                ));
                                updateLocationDisplay();
                              });
                              context.read<GoogleMapBloc>().add(afterGetEvent());
                              GoogleMapController controller = await _completer.future;
                              controller.animateCamera(CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  zoom: 12,
                                  target: LatLng(currentLatitude!, currentLongitude!),
                                ),
                              ));
                            },
                            title: Text(state.authocomplete[index]['description']),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return Container(
                    child: const Text('Error Occurred'),
                  );
                }
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/mybottom');
                },
                label: Text(
                  "back",
                  style: TextStyle(color: CustomColor.blackColor(), fontSize: 20),
                ),
                icon: Icon(Icons.arrow_back_ios, color: CustomColor.blackColor(), size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
