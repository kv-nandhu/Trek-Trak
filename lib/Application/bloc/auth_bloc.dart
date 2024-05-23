// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
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

    on<SignupEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final UserCredential = await _auth.createUserWithEmailAndPassword(
            email: event.user.email.toString(),
            password: event.user.password.toString());

        final user = UserCredential.user;

        if (user != null) {
          emit(Authenticated(user));
          FirebaseFirestore.instance.collection("users").doc().set({
            'Uid': user.uid,
            "Name": user.displayName,
            'email': user.email,
            "profile": user.photoURL,
            'Gender': 'No declared',
            'phone': event.user.phone,
            'createdAt': DateTime.now()
          });
        } else {
          emit(UnAuthenticated());
        }
      } on FirebaseAuthException catch (e) {
        emit(AuthenticatedError(message: e.message.toString()));
      }
    });

//*---------------->logout<--------------------------------
    on<LogoutEvent>((event, emit) async {
      try {
        await _auth.signOut();
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });
  }
}
