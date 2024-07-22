import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/Application/publish/publish_add/publish_add_bloc.dart';
import 'package:trek_trak/presentation/publish/demo_pages/drop_demo.dart';
import 'package:trek_trak/presentation/publish/demo_pages/pick_demo.dart';
import 'package:trek_trak/presentation/publish/inner_pages/calander.dart';
import 'package:trek_trak/presentation/publish/inner_pages/expense_calculating.dart';
import 'package:trek_trak/presentation/publish/inner_pages/passenger_count.dart';
import 'package:trek_trak/presentation/publish/inner_pages/time_select.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final TextEditingController timeController = TextEditingController();
final TextEditingController pickupController = TextEditingController();
final TextEditingController dropController = TextEditingController();
final TextEditingController middleCityController = TextEditingController();
final TextEditingController dateController = TextEditingController();
final TextEditingController passengerCountController = TextEditingController();
final TextEditingController expenseController = TextEditingController();
String? p_lang;
String? p_lati;
String? d_lang;
String? d_lati;

class LocationPickerPage extends StatefulWidget {
  const LocationPickerPage({Key? key}) : super(key: key);

  @override
  _LocationPickerPageState createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
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
        floatingActionButton:
            BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          if (state is UserProfileLoadState) {
            return BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is UserProfileLoadState) {
                  return FloatingActionButton(
                    onPressed: () {
                      if (state.user.vcolor != "vehicle color") {
                        BlocProvider.of<PublishAddBloc>(context).add(
                          AddRidePublishEvent(
                            uname: state.user.name!,
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
                            expence: expenseController.text,
                          ),
                        );
                        _submitForm(context);
                      } else {
                       showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Add Vehicle Details"),
                          content: Text("You haven't added vehicle details. Do you want to add them now?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text("No"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                                // Navigate to vehicle adding page
                                Navigator.pushNamed(context, '/PlateNumber');
                              },
                              child: Text("Yes"),
                            ),
                          ],
                        );});
                      }
                    },
                    backgroundColor: CustomColor.greenColor(),
                    foregroundColor: CustomColor.whiteColor(),
                    child: const Icon(Icons.check),
                  );
                } else {
                   return FloatingActionButton(
                    onPressed: () {
                    
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please add vehicle details first.'),
                          ),
                        );

                    },
                    backgroundColor: CustomColor.greenColor(),
                    foregroundColor: CustomColor.whiteColor(),
                    child: const Icon(Icons.check),
                  );
                }
              },
            );
          }else{
            return SizedBox();
          }
        }),
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
    print(p_lati);
    print(p_lang);
    return InkWell(
      onTap: () async {
        final result = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => KeralaLocationsDemo()));
        print("vggghhbhbh${result}");
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
    print(d_lang);
    print(d_lati);
    return InkWell(
      onTap: () async {
        final result = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => DropkeralaLocation()));
        print("========================================");
        print("sdfbsadfjkasdjkfhj${result}");
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
    Navigator.pushNamed(context, '/publishConfirm');
  }
}
