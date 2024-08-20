// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:equatable/equatable.dart';
// import 'package:trek_trak/infrastructure/chat/chat.dart';

// part 'chat_event.dart';
// part 'chat_state.dart';

// class ChatBloc extends Bloc<ChatEvent, ChatState> {
//   final ChatRepository _chatRepository;

//   ChatBloc(this._chatRepository) : super(ChatInitial()) {
//     on<SendMessageEvent>((event, emit) async {
//       try {
//         await _chatRepository.sendMessage(event);
//       } catch (e) {
//         emit(ChatError(e.toString()));
//       }
//     });

//     on<LoadMessagesEvent>((event, emit) async {
//       try {
//         final messagesStream = _chatRepository.getMessages(event.user1Uid, event.user2Uid);

//         await for (final snapshot in messagesStream) {
//           emit(ChatLoaded(snapshot));
//         }
//       } catch (e) {
//         emit(ChatError(e.toString()));
//       }
//     });
//   }
// }
