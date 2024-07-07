import 'package:flutter/material.dart';
import 'package:trek_trak/Application/publish_update/ride_publish_bloc.dart';
import 'package:trek_trak/presentation/publish/demo_pages/drop_demo.dart';
import 'package:trek_trak/presentation/publish/demo_pages/pick_demo.dart';
import 'package:trek_trak/presentation/publish/inner_pages/calander.dart';
import 'package:trek_trak/presentation/publish/inner_pages/expense_calculating.dart';
import 'package:trek_trak/presentation/publish/inner_pages/passenger_count.dart';
import 'package:trek_trak/presentation/publish/inner_pages/time_select.dart';
import 'package:trek_trak/presentation/publish/location_picker.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PublishEditing extends StatefulWidget {
  // final RidePublish? rideArguments;
  final String pickuplocation;
  final String dropitlocation;
  final String middlecity;
  final String time;
  final String date;
  final String passengercount;
  final String droplatitude;
  final String droplongitude;
  final String picklatitude;
  final String picklongitude;
  final String expence;

  PublishEditing({
    Key? key,
    // this.rideArguments,
    required this.pickuplocation,
    required this.dropitlocation,
    required this.middlecity,
    required this.time,
    required this.date,
    required this.passengercount,
    required this.droplatitude,
    required this.droplongitude,
    required this.picklatitude,
    required this.picklongitude,
    required this.expence,
  }) : super(key: key);

  @override
  _LocationPickerPageState createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<PublishEditing> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pickupController.text =widget.pickuplocation;
    dropController.text = widget.dropitlocation;
    timeController.text = widget.time;
    dateController.text = widget.date;
    passengerCountController.text = widget.passengercount;
    expenseController.text = widget.expence;
    p_lang = widget.picklongitude;
    p_lati = widget.picklatitude;
    d_lang = widget.droplongitude;
    d_lati = widget.droplatitude;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Ride Details",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.greenColor(),
                    ),
                  ),
                ),
                _buildSectionTitle("Pick-up"),
                _buildPickLocationInput(
                    "Add pick-up location", '/publish', pickupController),
                _buildSectionTitle("Drop-it"),
                _buildDropLocationInput(
                    "Add Drop-it location", '/dropLocation', dropController),
                _buildSectionTitle("Select Time"),
                _buildTimeInput(),
                _buildSectionTitle("Going date"),
                _buildCalendarInput(),
                _buildSectionTitle("Passenger count"),
                _buildPassengerCountInput(),
                _buildSectionTitle("Travel Expense"),
                _buildTravelExpenseInput(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<RidePublishBloc>(context).add(
              PublishRideEvent(
                pickuplocation: pickupController.text,
                dropitlocation: dropController.text,
                middlecity: 'add middle city',
                time: timeController.text,
                date: dateController.text,
                passengercount: passengerCountController.text,
                droplatitude: d_lati.toString(),
                droplongitude: d_lang.toString(),
                picklatitude: p_lati.toString(),
                picklongitude: p_lang.toString(),
                expense: expenseController.text, 
              ),
            );
            _submitForm(context);
          },
          backgroundColor: CustomColor.greenColor(),
          foregroundColor: CustomColor.whiteColor(),
          child: const Icon(Icons.check),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPickLocationInput(
      String placeholder, String routeName, TextEditingController controller) {
    return InkWell(
      onTap: () async {
        final result = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => KeralaLocationsDemo()));
        if (result != null) {
          setState(() {
            pickupController.text = result['pickuplocation'];
            p_lang = result['picklongitude'];
            p_lati = result['picklatitude'];
          });
        }
      },
      child: TextFormField(
        controller: pickupController,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: CustomColor.greyColor(),
          ),
        ),
        enabled: false,
      ),
    );
  }

  Widget _buildDropLocationInput(
      String placeholder, String routeName, TextEditingController controller) {
    return InkWell(
      onTap: () async {
        final result = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => DropkeralaLocation()));
        if (result != null) {
          setState(() {
            dropController.text = result['droplocation'];
            d_lang = result['droplongitude'];
            d_lati = result['droplatitude'];
          });
        }
      },
      child: TextFormField(
        controller: dropController,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: CustomColor.greyColor(),
          ),
        ),
        enabled: false,
      ),
    );
  }

  Widget _buildTimeInput() {
    return InkWell(
      onTap: () async {
        final result = await Navigator.push(
            context, MaterialPageRoute(builder: (context) => TimePickerPage()));
        if (result != null) {
          setState(() {
            timeController.text = result;
          });
        }
      },
      child: TextFormField(
        controller: timeController,
        decoration: InputDecoration(
          hintText: 'Add the time',
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: CustomColor.greyColor(),
          ),
        ),
        enabled: false,
      ),
    );
  }

  Widget _buildCalendarInput() {
    return InkWell(
      onTap: () async {
        final result = await Navigator.push(
            context, MaterialPageRoute(builder: (context) => CalendarPage()));
        if (result != null) {
          setState(() {
            dateController.text = result;
          });
        }
      },
      child: TextFormField(
        controller: dateController,
        decoration: InputDecoration(
          hintText: 'Select date',
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: CustomColor.greyColor(),
          ),
        ),
        enabled: false,
      ),
    );
  }

  Widget _buildPassengerCountInput() {
    return InkWell(
      onTap: () async {
        final result = await Navigator.push(
            context, MaterialPageRoute(builder: (context) => PassengerCount()));
        if (result != null) {
          setState(() {
            passengerCountController.text = result['passengerCount'].toString();
          });
        }
      },
      child: TextFormField(
        controller: passengerCountController,
        decoration: InputDecoration(
          hintText: 'Passenger count',
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: CustomColor.greyColor(),
          ),
        ),
        enabled: false,
      ),
    );
  }

  Widget _buildTravelExpenseInput() {
    return InkWell(
      onTap: () async {
        final result = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CalculateMileageScreen(
                      p_lati: p_lati,
                      p_lang: p_lang,
                      d_lang: d_lang,
                      d_lati: d_lati,
                    )));
        if (result != null) {
          setState(() {
            expenseController.text = result.toString();
          });
        }
      },
      child: TextFormField(
        controller: expenseController,
        decoration: InputDecoration(
          hintText: 'Add the price',
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: CustomColor.greyColor(),
          ),
        ),
        enabled: false,
      ),
    );
  }
    void _submitForm(BuildContext context) {
    timeController.clear();
    pickupController.clear();
    dropController.clear();
    middleCityController.clear();
    dateController.clear();
    passengerCountController.clear();
    expenseController.clear();
    p_lang = null;
    p_lati = null;
    d_lang = null;
    d_lati = null;
    Navigator.pushNamed(context, '/publishEditing');
  }
 
}


