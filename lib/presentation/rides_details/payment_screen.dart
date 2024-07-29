import 'package:flutter/material.dart';
import 'package:trek_trak/Application/payment/get_payment/get_payment_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetPaymentBloc>().add(GetPayment());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<GetPaymentBloc, GetPaymentState>(
            builder: (context, state) {
              if (state is GetPaymentLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is GetPaymentLoadedState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Payment',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: CustomColor.greenColor(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Please pay ₹ ${state.paymentRequest.first.expence}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Handle details button press
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.green,
                              backgroundColor: Colors.white,
                            ),
                            child: const Text('Details'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Payment Methods',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'images/gpayc.png',
                          height: 30,
                          width: 30,
                        ),
                        Text('example@upi', style: TextStyle(fontSize: 16)),
                        Icon(Icons.navigate_next, color: Colors.black),
                      ],
                    ),
                    const Divider(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'images/cashc.png',
                          height: 30,
                          width: 30,
                        ), // Replace with your cash icon
                        Text('Cash', style: TextStyle(fontSize: 16)),
                        Icon(Icons.navigate_next, color: Colors.black),
                      ],
                    ),
                    const Divider(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'images/paytmc.png',
                          height: 30,
                          width: 30,
                        ), // Replace with your cash icon
                        Text('paytm', style: TextStyle(fontSize: 16)),
                        Icon(Icons.navigate_next, color: Colors.black),
                      ],
                    ),
                    const Divider(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'images/phonec.png',
                          height: 30,
                          width: 30,
                        ), // Replace with your cash icon
                        Text('phonepe', style: TextStyle(fontSize: 16)),
                        Icon(Icons.navigate_next, color: Colors.black),
                      ],
                    ),
                  ],
                );
              } else {
                return Text("data");
              }
            },
          ),
        ),
      ),
    );
  }
}
