import 'dart:async';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:trek_trak/Application/google_maps/google_map_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';

class PickLocation extends StatefulWidget {
  PickLocation({super.key});

  @override
  State<PickLocation> createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
  final TextEditingController searchController = TextEditingController();
  final locationController = TextEditingController();
  List<Marker> _markers = [];
  final searchLocationcontroller = TextEditingController();
  Completer<GoogleMapController> _completer = Completer();
  double? currentLatitude;
  double? currentLongitude;

  @override
  void initState() {
    super.initState();
    // Initialize markers if needed
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<GoogleMapBloc, GoogleMapState>(
          builder: (context, state) {
            
           if(state is GoogleMapInitial){
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Align(
                     alignment: Alignment.topLeft,
                     child: TextButton.icon(
                       onPressed: () {
                         Navigator.pushReplacementNamed(
                             context, '/mybottom');
                       },
                       label: Text(
                         "Back",
                         style: TextStyle(
                           color: CustomColor.greenColor(),
                           fontSize: 15,
                         ),
                       ),
                       icon: Icon(
                         Icons.arrow_back_ios,
                         color: CustomColor.greenColor(),
                         size: 15,
                       ),
                     ),
                   ),
                   SizedBox(height: 20),
                   Text(
                     "Pick-up",
                     style: TextStyle(
                       fontSize: 30,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   SizedBox(height: 20),
                   TextField(
                     onChanged: (value) {
                       context.read<GoogleMapBloc>().add(AuthoCompleteLoadedEvent(serachInput: value));
                     },
                     decoration: InputDecoration(
                       prefixIcon: Icon(Icons.search),
                       suffixIcon: IconButton(
                         icon: Icon(Icons.clear),
                         onPressed: () {
                           searchController.clear();
                         },
                       ),
                       fillColor: Colors.grey[200],
                       filled: true,
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20.0),
                         borderSide: BorderSide.none,
                       ),
                     ),
                   ),
                    Expanded(
                            child: BlocBuilder<GoogleMapBloc,
                                GoogleMapState>(
                              builder: (context, state) {
                                if (state is AuthoCompleteLoading) {
                                  return SizedBox();
                                } else if (state is AuthoCompleteLoaded) {
                                  return Container(
                                    height: 300,
                                    color: state.authocomplete.isEmpty
                                        ? Colors.transparent
                                        : searchLocationcontroller.text.isEmpty
                                            ? Colors.transparent
                                            : Colors.white,
                                    child: ListView.builder(
                                      itemCount: state.authocomplete.length,
                                      itemBuilder: (context, index) {
                                        print(state.authocomplete.length);
                                        print("-------------------------------------------------------------");
                                        return ListTile(
                                          onTap: () async {
                                            searchLocationcontroller.text =
                                                state.authocomplete[index]
                                                    ['description'];
                                            List location = await Geocoder.local
                                                .findAddressesFromQuery(
                                                    state.authocomplete[index]
                                                        ['description']);
                                            // first = location.first;

                                            // setState(() {
                                            //   currentLatitude = first
                                            //       .coordinates.latitude!
                                            //       .toDouble();
                                            //   currentLongitude = first
                                            //       .coordinates.longitude!
                                            //       .toDouble();
                                            //   _list.add(Marker(
                                            //     markerId: MarkerId('1'),
                                            //     position: LatLng(
                                            //         currentLatitude!,
                                            //         currentLongitude!),
                                            //     infoWindow: InfoWindow(
                                            //         title: 'Searched Location'),
                                            //   ));
                                            // });

                                            // context
                                            //     .read<AuthoCompleteBloc>()
                                            //     .add(afterGetEvent());

                                            GoogleMapController controller =
                                                await _completer.future;
                                            controller.animateCamera(
                                                CameraUpdate.newCameraPosition(
                                                    CameraPosition(
                                              zoom: 12,
                                              target: LatLng(currentLatitude!,
                                                  currentLongitude!),
                                            )));
                                            
                                          },
                                          title: Text(state.authocomplete[index]
                                              ['description']),
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  return Container(
                                    child: Text('Error Occurred'),
                                  );
                                }
                              },
                            ),
                          ),
                 ],
               ),
             );
           }else if(state is GoogleMapState){
             return Stack(
              children: [
                GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    _completer.complete(controller);
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(37.43296265331129, -122.08832357078792),
                    zoom: 14,
                  ),
                  markers: Set<Marker>.of(_markers),
                  // Other GoogleMap properties as needed
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/mybottom');
                          },
                          label: Text(
                            "Back",
                            style: TextStyle(
                              color: CustomColor.greenColor(),
                              fontSize: 15,
                            ),
                          ),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: CustomColor.greenColor(),
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Pick-up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField( onChanged: (value) {
                       context.read<GoogleMapBloc>().add(AuthoCompleteLoadedEvent(serachInput: value));
                     }, controller: searchController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              searchController.clear();
                            },
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // Replace with your search result widget or content
                          child: Center(
                            child: Text("Search Results"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
           }else{
            return SizedBox();
           }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to the next screen
            Navigator.pushNamed(context, '/locationPickerPage');
          },
          backgroundColor: CustomColor.greenColor(),
          foregroundColor: CustomColor.whiteColor(),
          child: Icon(Icons.check),
        ),
      ),
    );
  }
}
