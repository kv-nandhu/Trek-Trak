import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/vehicle_detailsa/kind_of_vehicle.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:provider/provider.dart';

class ModelsSelecting extends StatefulWidget {
  final String selectedBrand;
  // final String selectedVehicleType;

  const ModelsSelecting({
    super.key,
    required this.selectedBrand,  
    // required this.selectedVehicleType, 
  });

  @override
  _ModelsSelectingState createState() => _ModelsSelectingState();
}

class _ModelsSelectingState extends State<ModelsSelecting> {
  final TextEditingController searchController = TextEditingController();
  final Map<String, List<String>> brandModels = {
    'Suzuki': ['Alto', 'Swift', 'Baleno'],
    'MG Motor': ['Hector', 'ZST', 'Astor'],
    'Volkswagen': ['Polo', 'Vento', 'Jetta'],
    'Mercedes Benz': ['A-Class', 'C-Class', 'E-Class'],
    'Jaguar': ['XE', 'XF', 'XJ'],
    'Maruti': ['800', 'Omni', 'Ertiga'],
    'Honda': ['Civic', 'Accord', 'City'],
    'Audi': ['A3', 'A4', 'A6'],
    'Jeep': ['Wrangler', 'Compass', 'Cherokee'],
    'Toyota': ['Corolla', 'Camry', 'Prius'],
    'Renault': ['Kwid', 'Duster', 'Triber'],
    'Tata': ['Nexon', 'Harrier', 'Safari'],
  };

  List<String> models = [];

  @override
  void initState() {
    super.initState();
    models = brandModels[widget.selectedBrand] ?? [];
    searchController.addListener(_filterModels);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterModels);
    searchController.dispose();
    super.dispose();
  }

  void _filterModels() {
    final query = searchController.text.toLowerCase();
    setState(() {
      models = brandModels[widget.selectedBrand]!
          .where((model) => model.toLowerCase().contains(query))
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
                    Navigator.pop(context);
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
                'Select Model',
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
                  itemCount: models.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              models[index],
                              style: const TextStyle(fontSize: 18),
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                context.read<ProfileBloc>().add(VehicleModelEvent(vmodel: models[index]));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VehicleTypeSelection(
                                      selectedBrand: widget.selectedBrand,
                                      selectedModel: models[index],
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
