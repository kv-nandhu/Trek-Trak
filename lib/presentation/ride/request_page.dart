// UI/request_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/get_request_ride/get_request_ride_data_bloc.dart';
import 'package:trek_trak/domain/request_data.dart';

class RequestItem extends StatefulWidget {
  final String uid;

  const RequestItem({super.key, required this.uid});

  @override
  State<RequestItem> createState() => _RequestItemState();
}

class _RequestItemState extends State<RequestItem> {
  @override
  void initState() {
    super.initState();
    context.read<GetRequestRideDataBloc>().add(FetchRequestRideDataEvent(uid: widget.uid));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRequestRideDataBloc, GetRequestRideDataState>(
      builder: (context, state) {
        if (state is GetRequestRideDataLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetRequestRideSuccess) {
          return ListView.builder(
            itemCount: state.requestList.length,
            itemBuilder: (context, index) {
              final request = state.requestList[index];
              return ListTile(
                title: Text(request.name ?? 'No name'),
                subtitle: Text(request.number ?? 'No number'),
                leading: request.image != null ? Image.network(request.image!) : null,
              );
            },
          );
        } else if (state is GetRequestRideError) {
          return Center(child: Text(state.error));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
