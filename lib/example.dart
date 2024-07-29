// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// StreamBuilder(
//                   stream: FirebaseFirestore.instance
//                       .collection('wish_lists')
//                       .where('u_uid',
//                           isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//                       .where('p_uid', isEqualTo: widget.packageModel.puid)
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.data == null) {
//                       return CircleAvatar(
//                         maxRadius: 30,
//                         backgroundColor: Colors.white,
//                         child: Center(
//                           child: Icon(
//                             Icons.favorite,
//                             color: Colors.grey[300],
//                             size: 40,
//                           ),
//                         ),
//                       );
//                     }
//                     return InkWell(
//                       onTap: () {
//                         if (snapshot.data!.docs.length == 0) {
//                           context.read<FavoretBloc>().add(
//                               AddWishEvent(packageModel: widget.packageModel));
//                         } else {
//                           String? uid;
//                           snapshot.data!.docs.forEach((element) {
//                             uid = element['w_uid'];
//                           });
//                           context
//                               .read<FavoretBloc>()
//                               .add(RemoveWishEvent(w_uid: uid!));
//                         }
//                       },
//                       child: CircleAvatar(
//                         maxRadius: 30,
//                         backgroundColor: Colors.white,
//                         child: Center(
//                           child: Icon(
//                             Icons.favorite,
//                             size: 40,
//                             color: snapshot.data!.docs.length == 0
//                                 ? Colors.grey[300]
//                                 : Colors.red,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 )
                
        