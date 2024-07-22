import 'package:flutter/material.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/presentation/ride_joining/custom/user_details/user_details.dart';

  
  Widget secondSessionAccept({ String? uname, String? image}) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Column(
                children: [
                  Text(
                    uname!,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.grey),
                      Text('3.8/5 - 6 ratings'),
                    ],
                  ),
                ],
              ),
            Row(
              children: [
                 CircleAvatar(
                    radius: 30,
                  
                    
                    backgroundImage: image != null
                        ? NetworkImage(image!)
                        : null,
                    child: image == null
                        ? Icon(Icons.person, size: 60)
                        : null,
                  ),
                  
              ],
            ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Icon(Icons.verified, color: Colors.blue),
              Text('Verified Profile'),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Icon(Icons.cancel, color: Colors.green),
              Text('Rarely cancels rides'),
            ],
          ),
        ],
      ),
    );
  }

