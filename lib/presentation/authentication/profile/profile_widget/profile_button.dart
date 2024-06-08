// import 'package:flutter/material.dart';
// import 'package:trek_trak/Application/Auth/auth_bloc.dart';
// import 'package:trek_trak/presentation/authentication/login/login_widget/login_fields.dart';
// import 'package:trek_trak/presentation/authentication/password/password.dart';
// import 'package:trek_trak/utils/color/color.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//   late final GlobalKey<FormState> formKey;
//     late final PasswordScreen widget;
// class UserButtons {
//   static userButton(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: InkWell(
//         onTap: () {
//           // Navigator.pushReplacementNamed(context, '/Success');
//             if (formKey.currentState!.validate()) {
//             BlocProvider.of<AuthBloc>(context).add(
//                 signwithemailandpasswordEvent(
//                     password: passwordController.text,
//                     name: widget.name,
//                     number: widget.number,
//                     gender: widget.gender,
//                     email: widget.email,
//                     context: context, city: '', street: '', district: '', dob: ''));
//             };},
//         child: Container(
//           height: 50,
//           width: 300,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: CustomColor.greenColor(),
//           ),
//           child: Align(
//             alignment: Alignment.center,
//             child: Text(
//               'Save',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: CustomColor.whiteColor(),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
