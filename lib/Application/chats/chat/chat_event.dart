// part of 'chat_bloc.dart';

// abstract class ChatEvent extends Equatable {
//   const ChatEvent();
// }

// class SendMessageEvent extends ChatEvent {
//   final String user1Uid;
//   final String user2Uid;
//   final String message;
//   final String senderName;
//   final String recieverName;
//   final String recieverImage;
//   final String senderImage;


//   const SendMessageEvent(
//     this.user1Uid,
//     this.user2Uid,
//     this.message,
//     this.senderName,
//     this.senderImage,
//     this.recieverName,
//     this.recieverImage,
//   );

//   @override
//   List<Object> get props => [user1Uid, user2Uid, message];
// }

// class LoadMessagesEvent extends ChatEvent {
//   final String user1Uid; // ID of the user requesting the messages
//   final String user2Uid; // ID of the other user in the chat

//   const LoadMessagesEvent(this.user1Uid, this.user2Uid);

//   @override
//   List<Object> get props => [user1Uid, user2Uid];
// }
