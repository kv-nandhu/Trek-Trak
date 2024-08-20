// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/infrastructure/chat/chat.dart';

part 'chat_room_event.dart';
part 'chat_room_state.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  MessageRepo _messageRepo = MessageRepo();
  ChatRoomBloc(this._messageRepo) : super(const ChatRoomState()) {
    on<getChatListEvent>(_getChatlist);
  }

  FutureOr<void> _getChatlist(
      getChatListEvent event, Emitter<ChatRoomState> emit) async {
    try {
      emit(ChatLaodingState());
      List<UserModel> list = await _messageRepo.getChatUsers(event.search);
      Future.delayed(const Duration(seconds: 4));
      emit(ChatLoadedState(ChatList: list));
    } catch (e) {
      throw Exception(e);
    }
  }
}