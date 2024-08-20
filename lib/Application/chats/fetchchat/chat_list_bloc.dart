// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:trek_trak/infrastructure/chat/chat.dart';

// part 'chat_list_event.dart';
// part 'chat_list_state.dart';

// class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
//   final ChatRepository _chatRepository;

//   ChatListBloc(this._chatRepository) : super(ChatListInitial()) {
//     on<LoadChatListEvent>((event, emit) async {
//       try {
//         final chatList = await _chatRepository.fetchChatList(event.userUid);
//         emit(ChatListLoaded(chatList));
//       } catch (e) {
//         emit(ChatListError(e.toString()));
//       }
//     });
//   }
// }
