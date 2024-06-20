import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/vehicle_detailsa/vehicle_model.dart';
import 'package:trek_trak/utils/color/color.dart';

import 'package:provider/provider.dart';

class BrandVehicle extends StatefulWidget {
  const BrandVehicle({super.key});

  @override
  State<BrandVehicle> createState() => _BrandVehicleState();
}

class _BrandVehicleState extends State<BrandVehicle> {
  final TextEditingController searchController = TextEditingController();
  final List<String> carBrands = [
    'Suzuki', 'MG Motor', 'Volkswagen', 'Mercedes Benz', 'Jaguar', 'Maruti',
    'Honda', 'Audi', 'Jeep', 'Toyota', 'Renault', 'Tata'
  ];
  List<String> filteredCarBrands = [];

  @override
  void initState() {
    super.initState();
    filteredCarBrands = carBrands;
    searchController.addListener(_filterCarBrands);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterCarBrands);
    searchController.dispose();
    super.dispose();
  }

  void _filterCarBrands() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredCarBrands = carBrands
          .where((brand) => brand.toLowerCase().contains(query))
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
                'What is your vehicle\'s \n brand',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: searchController,
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
                  itemCount: filteredCarBrands.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              filteredCarBrands[index],
                              style: const TextStyle(fontSize: 18),
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                context.read<ProfileBloc>().add(VehilceBrandEvent(vbrand: filteredCarBrands[index]));

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ModelsSelecting(
                                      selectedBrand: filteredCarBrands[index], 
                                      // selectedVehicleType: selectedVehicleType,
                                    ),
                                  ),
                                );
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
