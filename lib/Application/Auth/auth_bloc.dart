// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
//import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
//import 'package:trek_trak/Auth_repos/auth_repo.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/repository/Auth_repos/auth_repo.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthBloc() : super(AuthInitial()) {
    on<CheckLoginStatusEvent>((event, emit) async {
      User? user;
      try {
        await Future.delayed(const Duration(seconds: 3), () {
          user = _auth.currentUser;
        });

        if (user != null) {
          emit(Authenticated(user));
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });

//*-------------------->login<----------------------

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final UserCredential = await _auth.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        final user = UserCredential.user;
        if (user != null) {
          emit(Authenticated(user));
        } else {
          emit(UnAuthenticated());
        }
      } on FirebaseAuthException catch (e) {
        emit(AuthenticatedError(message: e.message.toString()));
      }
    });

    //*---------------->text<--------------------
    on<TextEvent>((event, emit) {
      if (event.obscure) {
        emit(TextState(obscure: false));
      } else {
        emit(TextState(obscure: true));
      }
    });

//*-------------->sign<-------------------------

    // on<SignupEvent>((event, emit) async {
    //   emit(AuthLoading());

    //   try {
    //     final UserCredential = await _auth.createUserWithEmailAndPassword(
    //         email: event.user.email.toString(),
    //         password: event.user.password.toString());

    //     final user = UserCredential.user;

    //     if (user != null) {
    //       emit(Authenticated(user));
    //       FirebaseFirestore.instance.collection("users").doc().set({
    //         'Uid': user.uid,
    //         "Name": user.displayName,
    //         'email': user.email,
    //         "profile": user.photoURL,
    //         'Gender': 'No declared',
    //         'phone': event.user.phone,
    //         'createdAt': DateTime.now()
    //       });
    //     } else {
    //       emit(UnAuthenticated());
    //     }
    //   } on FirebaseAuthException catch (e) {
    //     emit(AuthenticatedError(message: e.message.toString()));
    //   }
    // });

//*---------------->logout<--------------------------------
    on<LogoutEvent>((event, emit) async {
      try {
        await _auth.signOut();
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });

    on<sentotpEvent>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(
        const Duration(seconds: 2),
      );
      emit(AuthLoading());
      try {
        await FirebaseAuthentServices().phoneNumberAuth(
            event.number, event.email, event.name, event.gender, event.context);
        emit(AuthSnedSuccess());
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });

    on<verificationOtpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(const Duration(seconds: 2));
        await FirebaseAuthentServices().checkingOtp(
            event.otp,
            event.name,
            event.gender,
            event.email,
            event.number,
            event.verificationId,
            event.context);
        emit(AuthVerificationSuccessn());
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
   
      }
    });

    on<signwithemailandpasswordEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await FirebaseAuthentServices().registerUser(
            context: event.context,
            email: event.email,
            name: event.name,
            number: event.number,
            password: event.password,
            gender: event.gender);
        emit(AuthVerificationSuccessn());
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
    
      }
    });

    on<SignInevent>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(const Duration(seconds: 2));
        FirebaseAuthentServices()
            .signIn(event.email, event.password, event.context);
        emit(AuthVerificationSuccessn());
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });
  }
}
