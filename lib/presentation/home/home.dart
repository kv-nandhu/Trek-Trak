import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/all_data_getting/data_getting_bloc.dart';
import 'package:trek_trak/Application/publish_update/ride_publish_bloc.dart';
import 'package:trek_trak/domain/publish_model.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/data_get.dart';
import 'package:trek_trak/infrastructure/repository/publish/publish_repo.dart';
import 'package:trek_trak/presentation/publish/location_picker.dart';
import 'package:trek_trak/utils/color/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DataGettingBloc>().add(GetRidePublishEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(179, 196, 177, 177),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: BlocBuilder<DataGettingBloc, DataGettingState>(
        builder: (context, state) {
          if (state is RidePublishLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }else if (state is RidePublishErrorState) {
            return Center(child: Text('Error: ${state.error}'));
          } 
           else if (state is RidePublishedSuccessState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IconButton(onPressed: (){
                    context.read<DataGettingBloc>().add(GetRidePublishEvent());
                  }, icon: Icon(Icons.restart_alt)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Moving Today",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        _buildRideCard( state.ride),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildVerticalList(state.ride),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildRideCard(List<RidePublish> ridePublish) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: ridePublish.map((publish) {
        return Container(
          width: 200,
          height: 250,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/car_icon.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Depart At ${publish.time}"),
                    const SizedBox(height: 8),
                    Text("From: ${publish.pickuplocation}"),
                    const SizedBox(height: 8),
                    Text("To: ${publish.dropitlocation??'malapuram'}"),
                    const Divider(height: 20, thickness: 1),
                    Row(
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: 8),
                        Text("farhan"),
                        const Spacer(),
                         
                         Text('${publish.expence}',style: TextStyle(color: CustomColor.redColor()),),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    ),
  );
}

Widget _buildVerticalList(List<RidePublish> ridePublish) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: ridePublish.length,
    itemBuilder: (context, index) {
      final publish = ridePublish[index];
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('images/car_icon.png', width: 60, height: 60),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${publish.pickuplocation} - ${publish.dropitlocation}"),
                    const SizedBox(height: 8),
                    Text("Passenger Count: ${publish.passengercount}"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(height: 20, thickness: 1),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Name: Farhan"),
                    const SizedBox(height: 4),
                   Text('rate: ${publish.expence}'),
                  ],
                ),
                const Spacer(),
                Text("${publish.time}"),
              ],
            ),
          ],
        ),
      );
    },
  );
}
}