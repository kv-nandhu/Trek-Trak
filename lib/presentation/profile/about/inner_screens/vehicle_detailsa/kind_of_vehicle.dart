import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:provider/provider.dart';

class VehicleTypeSelection extends StatefulWidget {
   final String selectedBrand;
  final String selectedModel;
   VehicleTypeSelection({super.key, required this.selectedBrand, required this.selectedModel});

  @override
  _VehicleTypeSelectionState createState() => _VehicleTypeSelectionState();
}

class _VehicleTypeSelectionState extends State<VehicleTypeSelection> {
  final TextEditingController searchController = TextEditingController();
  final List<String> vehicleTypes = [
    'Hatchback',
    'Sedan',
    'Convertible',
    'Estate',
    'SUV',
    'Station Wagon'
  ];

  List<String> filteredVehicleTypes = [];

  @override
  void initState() {
    super.initState();
    filteredVehicleTypes = vehicleTypes;
    searchController.addListener(_filterVehicleTypes);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterVehicleTypes);
    searchController.dispose();
    super.dispose();
  }

  void _filterVehicleTypes() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredVehicleTypes = vehicleTypes
          .where((type) => type.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/mybottom');
                  },
                  label: Text(
                    "Back",
                    style: TextStyle(
                        color: CustomColor.greenColor(), fontSize: 15),
                  ),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: CustomColor.greenColor(),
                    size: 15,
                  ),
                ),
              ),
              const Text(
                'What kind of vehicle?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: searchController,
                onChanged: (value) => _filterVehicleTypes(),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredVehicleTypes.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              filteredVehicleTypes[index],
                              style: const TextStyle(fontSize: 18),
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                     context.read<ProfileBloc>().add( VehilceTypeEvent(vtype: filteredVehicleTypes[index]));
                                Navigator.pushReplacementNamed(context, '/colorListScreen');
                              },
                            ),
                          ],
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
