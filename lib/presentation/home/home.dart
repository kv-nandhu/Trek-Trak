import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/all_data_getting/data_getting_bloc.dart';
import 'package:trek_trak/presentation/home/custom/build_ride_card.dart';
import 'package:trek_trak/presentation/home/custom/build_vertical_list.dart';
import 'package:trek_trak/presentation/home/custom/search_screen.dart';
import 'package:trek_trak/presentation/home/custom/shimer.dart';
import 'package:trek_trak/presentation/home/custom/title.dart';
import 'package:trek_trak/presentation/home/notification/notification.dart';
// import 'package:trek_trak/presentation/home/search_screen.dart';

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

  void _openSearchScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(),
      ),
    );

    if (result != null) {
      final from = result['from'];
      final to = result['to'];
      final date = result['date'];

      context.read<DataGettingBloc>().add(SearchRidesEvent(
        fromLocation: from,
        toLocation: to,
        date: date,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(179, 241, 244, 241),
    appBar: AppBar(
          centerTitle: true,
          title: const title(),
           actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                  Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotificationPage()));
               
              },
            ),
          ],
          ),
      body: BlocBuilder<DataGettingBloc, DataGettingState>(
        builder: (context, state) {
          if (state is RidePublishLoadingState) {
            return const CurrentUserShimmerEffect();
          } else if (state is RidePublishErrorState) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state is RidePublishedEmptyState) {
            return Center(child: Text('No rides found for the given criteria.'));
          } else if (state is RidePublishedSuccessState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                      onTap: _openSearchScreen,
                      readOnly: true,
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
                      children: state.ride.map((ride) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: buildRideCard(state.ride, context),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 32),
                  buildVerticalList(state.ride),
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
}
