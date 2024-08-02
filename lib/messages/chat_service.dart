// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
//
// class ChatService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<void> sendMessage(String text, String userId, String chatId) async {
//     final message = Message(
//       text: text,
//       userId: userId,
//       createdAt: Timestamp.now(),
//     );
//     await _firestore.collection('chats').doc(chatId).collection('messages').add(message.toMap());
//   }
//
//   Stream<QuerySnapshot> getMessages(String chatId) {
//     return _firestore.collection('chats').doc(chatId).collection('messages').snapshots();
//   }
// }