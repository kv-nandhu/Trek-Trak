import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trek_trak/Application/all_data_getting/data_getting_bloc.dart';
import 'package:trek_trak/presentation/home/custom/search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onTap: () async{
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
        },
        readOnly: true,
      ),
    );
  }
}


