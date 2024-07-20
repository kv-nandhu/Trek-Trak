import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trek_trak/Application/google_maps/google_map_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:geocoding/geocoding.dart';
class DropLocation extends StatefulWidget {
  DropLocation({Key? key});

  @override
  State<DropLocation> createState() => _AddMapScreenState();
}

class _AddMapScreenState extends State<DropLocation> {
  final locationController = TextEditingController();
  List<Marker> _marker = [];
  List<Marker> _list = [];
  final searchLocationcontroller = TextEditingController();
  CameraPosition _kLake = CameraPosition(
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
    _marker.addAll(_list);
  }

  dynamic first;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
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
                height: 80,
                decoration: BoxDecoration(
                    color: CustomColor.greenColor(),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20))),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Delivery To",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "You selected Location show Here",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 350,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 30,
                                  child: ListView(
                                    children: [
                                      Text(
                                        "${searchLocationcontroller.text}",
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 212, 209, 209),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    height: 150,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.white54),
                        BoxShadow(color: Colors.black12),
                      ],
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20)),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
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
                  return Stack(
                    children: [
                      GoogleMap(
                        initialCameraPosition: _kLake,
                        onMapCreated: (GoogleMapController controller) {
                          print(state.markerlist);
                          _completer.complete(controller);
                        },
                       
                        markers: Set<Marker>.of(_marker),
                      ),
                    ],
                  );
                },
              ),
            ),
            Positioned(
              top: 38,
              bottom: 0,
              left: 0,
              right: 0,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Column(
                          children: [
                            BlocBuilder<GoogleMapBloc, GoogleMapState>(
                              builder: (context, state) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: TextField(
                                          onChanged: (value) {
                                            context.read<GoogleMapBloc>().add(
                                                AuthoCompleteLoadedEvent(
                                                    serachInput: value));
                                          },
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10.0),
                                            hintText: "Search Location",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      CustomColor.greenColor()),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.grey[200],
                                            hintStyle: const TextStyle(
                                              fontSize: 14,
                                            ),
                                            prefixIcon: const Icon(
                                              Icons.search,
                                              size: 22,
                                              color: Colors.black,
                                            ),
                                          ),
                                          controller: searchLocationcontroller,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Expanded(
                              child: BlocBuilder<GoogleMapBloc, GoogleMapState>(
                                builder: (context, state) {
                                  if (state is AuthoCompleteLoading) {
                                    return const SizedBox();
                                  } else if (state is AuthoCompleteLoaded) {
                                    return Container(
                                      height: 300,
                                      color: state.authocomplete.isEmpty
                                          ? Colors.transparent
                                          : searchLocationcontroller
                                                  .text.isEmpty
                                              ? Colors.transparent
                                              : Colors.white,
                                      child: ListView.builder(
                                        itemCount: state.authocomplete.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            onTap: () async {
                                              searchLocationcontroller.text =
                                                  state.authocomplete[index]
                                                      ['description'];
                                                      print(searchLocationcontroller.text);
                                              context
                                                  .read<GoogleMapBloc>()
                                                  .add(afterGetEvent());
                                              List<Location> locations = await locationFromAddress(state.authocomplete[index]
                                                      ['description']);

                              setState(() {
                                currentLatitude =locations.last.latitude.toDouble();
                                currentLongitude = locations.last.longitude.toDouble();
                                _marker.clear();
                                _marker.add(Marker(
                                  markerId: MarkerId('1'),
                                  position: LatLng(currentLatitude!, currentLongitude!),
                                  infoWindow: InfoWindow(title: 'Searched Location'),
                                ));
                               
                              });
                                              context
                                                  .read<GoogleMapBloc>()
                                                  .add(afterGetEvent());

                                              GoogleMapController controller =
                                                  await _completer.future;
                                              controller.animateCamera(
                                                  CameraUpdate
                                                      .newCameraPosition(
                                                          CameraPosition(
                                                zoom: 12,
                                                target: LatLng(currentLatitude!,
                                                    currentLongitude!),
                                              )));
                                            },
                                            title: Text(
                                                state.authocomplete[index]
                                                    ['description']),
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      child: const Text('Error Occurred'),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/mybottom');
                  },
                  label: Text(
                    "back",
                    style: TextStyle(
                      color: CustomColor.blackColor(),
                      fontSize: 20,
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: CustomColor.blackColor(),
                    size: 20,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
