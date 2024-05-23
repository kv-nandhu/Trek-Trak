import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  
  @override
  void initState() {
   gohome();
    super.initState();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( 
                height: 200,
                width: 200,
                  child: Image.asset("images/success.png")),
                     Text("SUCCESS",style: TextStyle(fontSize: 30),),
                  Text("Congratulations, your account \n has been successfully created",style: TextStyle(fontSize: 20),)
           
            ],
          ),
        ),
      ),
    );
  }
  Future<void> gohome() async {
    await Future.delayed(Duration(seconds: 3));
      Navigator.pushReplacementNamed(context, '/');
  }
}