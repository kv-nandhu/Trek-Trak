// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(const BottomNavigationBarInitial(tabIndex: 0)) {
    on<BottomNavigationBarEvent>((event, emit) {
        if(event is TabChange) {
          emit(BottomNavigationBarInitial(tabIndex: event.tabIndex));
        }
    });
  }
}
