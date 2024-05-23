
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Future<UserModel?> signWWithGoogle() async {
//   try {
//     final googleUser = await GoogleSignIn().signIn();
//     if(googleUser == null) return null;
//     final googleAuth =await googleUser.authentication;
//     final creds = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken);
//   }catch (e) {
//     print(e);
//     return null;
//   }

// }



import 'package:flutter/material.dart';

class buttongoogle_widget extends StatelessWidget {
  buttongoogle_widget({
    super.key,
  });
 //AuthRepoGoogle google=AuthRepoGoogle();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
        // AuthRepoGoogle().signInWithGoogle(context,true);
        
        },
        child: Container(
          height: 50,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:Colors.black,
          ),
          child: Center(
            child: Row(children: [
              SizedBox(
                width: 40,
              ),
              SizedBox(
                width: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircleAvatar(
                  minRadius: 20,
                  backgroundImage:
                      AssetImage('lib/assests/images/downloadgoogleicon.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Sign up with Google',
                  style: Theme.of(context).textTheme.displayLarge,
                  
                ),
                //  CircularProgressIndicator()
              ]),
            ]),
          ),
        ));
  }
}