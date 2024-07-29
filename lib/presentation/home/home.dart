import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/accept/get_accepted_data/get_accepted_data_bloc.dart';
import 'package:trek_trak/Application/all_data_getting/data_getting_bloc.dart';
import 'package:trek_trak/presentation/home/custom/build_ride_card.dart';
import 'package:trek_trak/presentation/home/custom/build_vertical_list.dart';
import 'package:trek_trak/presentation/home/custom/search_page.dart';
import 'package:trek_trak/presentation/home/custom/shimer.dart';
import 'package:trek_trak/presentation/home/custom/title.dart';
import 'package:trek_trak/presentation/home/notification/notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _notificationCount = 0;

  @override
  void initState() {
    super.initState();
    context.read<DataGettingBloc>().add(GetRidePublishEvent());
    _fetchNotificationCount();
  }

  void _fetchNotificationCount() async {
    context.read<GetAcceptedDataBloc>().add(GetAcceptDataEvent());
    final state = context.read<GetAcceptedDataBloc>().state;
    if (state is GetAcceptedloadedState) {
      setState(() {
        _notificationCount = state.unreadNotificationCount;
      });
    }
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Fetch notification count only on initState and after navigating back
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: const Color.fromARGB(179, 241, 244, 241),
      appBar: AppBar(
        centerTitle: true,
        title: const title(),
        actions: [
          BlocBuilder<GetAcceptedDataBloc, GetAcceptedDataState>(
            builder: (context, state) {
              if (state is GetAcceptedloadedState) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationPage(),
                          ),
                        );
                        _fetchNotificationCount(); // Refresh count after navigating back
                      },
                    ),
                    if (state.unreadNotificationCount > 0)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            '${state.unreadNotificationCount}',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                  ],
                );
              }
              return IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationPage(),
                    ),
                  );
                  _fetchNotificationCount(); // Refresh count after navigating back
                },
              );
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
          } else if (state is RidePublishedSuccessState) {
            if (state.ride.isEmpty) {
              return const Center(child: Text('No rides found.'));
            }

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
                  // text(),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: state.ride.map((ride) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: buildRideCard(
                            state.ride, // Pass individual ride
                            context,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 32),
                  buildVerticalList(state.ride),
                ],
              ),
            );
          } else{
            return const Center(child: text('fff'),);
          }
        },
      ),
    );
  }
}
