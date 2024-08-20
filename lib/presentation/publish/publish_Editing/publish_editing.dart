import 'package:flutter/material.dart';
import 'package:trek_trak/presentation/publish/publish_Editing/custom/pop_up.dart';
import 'package:trek_trak/presentation/publish/publish_Editing/custom/date_edit.dart';
import 'package:trek_trak/presentation/publish/publish_Editing/custom/drop_location_edit.dart';
import 'package:trek_trak/presentation/publish/publish_Editing/custom/expence_edit.dart';
import 'package:trek_trak/presentation/publish/publish_Editing/custom/passenger_count_edit.dart';
import 'package:trek_trak/presentation/publish/publish_Editing/custom/pick_location_edit.dart';
import 'package:trek_trak/presentation/publish/publish_Editing/custom/time_edit.dart';
import 'package:trek_trak/utils/color/color.dart';

class PublishEditing extends StatefulWidget {
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
  final String fromuid;

  PublishEditing({
    Key? key,
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
    required this.fromuid,
  }) : super(key: key);

  @override
  _PublishEditingState createState() => _PublishEditingState();
}

class _PublishEditingState extends State<PublishEditing> {
  TextEditingController pickupController = TextEditingController();
  TextEditingController dropController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController passengerCountController = TextEditingController();
  TextEditingController expenseController = TextEditingController();

  String p_lang = '';
  String p_lati = '';
  String d_lang = '';
  String d_lati = '';

  bool isPickLocationChanged = false;
  bool isDropLocationChanged = false;

  @override
  void initState() {
    super.initState();
    pickupController = TextEditingController(text: widget.pickuplocation);
    dropController = TextEditingController(text: widget.dropitlocation);
    timeController = TextEditingController(text: widget.time);
    dateController = TextEditingController(text: widget.date);
    passengerCountController =
        TextEditingController(text: widget.passengercount);
    expenseController = TextEditingController(text: widget.expence);
    p_lang = widget.picklongitude;
    p_lati = widget.picklatitude;
    d_lang = widget.droplongitude;
    d_lati = widget.droplatitude;
  }

  @override
  void dispose() {
    pickupController.dispose();
    dropController.dispose();
    timeController.dispose();
    dateController.dispose();
    passengerCountController.dispose();
    expenseController.dispose();
    super.dispose();
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
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
        final result = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    KeralaLocationsEDit(fromuid: widget.fromuid)));
        if (result != null && result is Map<String, dynamic>) {
          setState(() {
            pickupController.text = result['pickuplocation'] ?? '';
            p_lang = result['picklongitude'] ?? '';
            p_lati = result['picklatitude'] ?? '';
            isPickLocationChanged = true; // Track location change
          });
        }
      },
      child: TextFormField(
        controller: controller,
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
        final result = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DropLocationEdit(fromuid: widget.fromuid)));
        if (result != null && result is Map<String, dynamic>) {
          setState(() {
            dropController.text = result['droplocation'] ?? '';
            d_lang = result['droplongitude'] ?? '';
            d_lati = result['droplatitude'] ?? '';
            isDropLocationChanged = true; // Track location change
          });
        }
      },
      child: TextFormField(
        controller: controller,
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
            context,
            MaterialPageRoute(
                builder: (context) => TimeEditScreen(fromuid: widget.fromuid)));
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
            context,
            MaterialPageRoute(
                builder: (context) => DateEditScreen(fromuid: widget.fromuid)));
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
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PassengerCountEdit(fromuid: widget.fromuid)));
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
                builder: (context) => CalculateMileageEdit(
                      fromuid: widget.fromuid,
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
          hintText: 'Travel expense',
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
  print("Pick location changed: $isPickLocationChanged");
  print("Drop location changed: $isDropLocationChanged");
  print("Current expense: ${expenseController.text}");
  print("Original expense: ${widget.expence}");

  if (isPickLocationChanged || isDropLocationChanged) {
    if (expenseController.text.isEmpty || expenseController.text == widget.expence) {
      TopNotification.show(
        context,
        "You have changed the location. Please update the expense.",
      );
      return;
    }
  }

  TopNotification.show(
    context,
    "Updated successfully.",
  );

  // Clear fields and navigate
  timeController.clear();
  pickupController.clear();
  dropController.clear();
  dateController.clear();
  passengerCountController.clear();
  expenseController.clear();
  p_lang = '';
  p_lati = '';
  d_lang = '';
  d_lati = '';

  // Ensure the route exists and is defined correctly
  Navigator.pushNamed(context, '/mybottom').then((_) {
    print("Navigation to /mybottom successful.");
  }).catchError((error) {
    print("Navigation error: $error");
  });
}

}
