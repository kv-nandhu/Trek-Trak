import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:trek_trak/Application/payment/get_payment/get_payment_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:trek_trak/utils/divider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Razorpay _razorpay;
  double? _lastPaymentAmount;
  String? _paymentRequestId;
  late String _currentUserId;
  late Stream<List<Map<String, dynamic>>> _paymentHistoryStream;

  @override
  void initState() {
    super.initState();
    context.read<GetPaymentBloc>().add(GetPayment());
    _razorpay = Razorpay();

    _currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';

    _paymentHistoryStream = FirestoreService(_currentUserId).getCompletedPayments();

    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _openCheckout(double amount, String paymentRequestId) {
    setState(() {
      _lastPaymentAmount = amount;
      _paymentRequestId = paymentRequestId;
    });

    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': amount * 100,
      'name': 'Trek Trak',
      'description': 'Payment for your ride',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '9778574297', 'email': 'kvnandhu09@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    _razorpay.open(options);
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    showAlertDialog(
      context,
      "Payment Failed",
      "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.message.toString()}",
    );
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
    final amount = _lastPaymentAmount;

    if (amount != null && _paymentRequestId != null) {
      await FirebaseFirestore.instance.collection('completedPayments').add({
        'userId': _currentUserId,
        'paymentId': response.paymentId,
        'amount': amount,
        'timestamp': FieldValue.serverTimestamp(),
      });

      await FirebaseFirestore.instance
          .collection('payment_request')
          .doc(_paymentRequestId)
          .delete();
    }

    showAlertDialog(
      context,
      "Payment Successful",
      "Payment ID: ${response.paymentId}",
    );
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [continueButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<GetPaymentBloc, GetPaymentState>(
                builder: (context, state) {
                  if (state is GetPaymentLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetPaymentLoadedState) {
                    if (state.paymentRequest.isEmpty) {
                      return const Center(
                        child: Text(
                          "No payment requests available",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      );
                    }

                    final String? expenseString = state.paymentRequest.first.expence;
                    final double amount = double.tryParse(expenseString ?? '') ?? 0.0;
                    final String? paymentRequestId = state.paymentRequest.first.paymentId;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(paymentRequestId ?? "Payment Request ID not available"),
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
                                'Please pay ₹ ${amount.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _openCheckout(amount, paymentRequestId!);
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.green,
                                  backgroundColor: Colors.white,
                                ),
                                child: const Text('Pay Now'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Text("No data available");
                  }
                },
              ),
              const SizedBox(height: 30),
              const Text(
                'Payment History',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: StreamBuilder<List<Map<String, dynamic>>>(
                  stream: _paymentHistoryStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                       print(snapshot.error);
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error loading payment history: ${snapshot.error}"),
                      
                      );
    
                    }
                 
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No payment history available"));
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final payment = snapshot.data![index];
                        final timestamp = payment['timestamp'] as Timestamp?;
                        final formattedDate = timestamp != null
                            ? DateFormat('yyyy-MM-dd – kk:mm').format(timestamp.toDate())
                            : 'N/A';

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Amount: ₹${payment['amount']}'),
                                    const SizedBox(height: 10),
                                    Text('Payment ID: ${payment['paymentId']}'),
                                    const SizedBox(height: 10),
                                    Text('Date: $formattedDate'),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ),
                            const divider_normal(),
                          ],
                        );
                      },
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

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String userId;

  FirestoreService(this.userId);

  Stream<List<Map<String, dynamic>>> getCompletedPayments() {
    return _db
        .collection('completedPayments')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
          print('Snapshot data: ${snapshot.docs}');  // Added logging
          return snapshot.docs.map((doc) {
            final data = doc.data();
            return {
              'paymentId': data['paymentId'],
              'amount': data['amount'],
              'timestamp': data['timestamp'],
            };
          }).toList();
        });
  }
}
