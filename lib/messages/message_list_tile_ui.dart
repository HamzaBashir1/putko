// import 'package:flutter/material.dart';
// class Message {
//   String? text;
//   Sender? sender;
//
//   Message({this.text, this.sender});
//
//   String get getMessageDateTime {
//     // Return the message date time here
//     // For example:
//     return DateTime.now().toString();
//   }
// }
//
// class Sender {
//   String? imageUrl;
//
//   Sender({this.imageUrl});
// }
//
// class MessageListTileUI extends StatelessWidget {
//   final Message message;
//   final String currentImageUrl;
//
//   const MessageListTileUI({super.key, required this.message, required this.currentImageUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     if (message.sender!.imageUrl == currentImageUrl) {
//       return Padding(
//         padding: EdgeInsets.fromLTRB(16, 16, 36, 16),
//         child: Row(
//           children: [
//             Flexible(
//               child: Padding(
//                 padding: EdgeInsets.only(left: 11),
//                 child: Container(
//                   padding: EdgeInsets.all(15),
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 10),
//                         child: Text(
//                           message.text!,
//                           style: TextStyle(fontSize: 20.0),
//                           textWidthBasis: TextWidthBasis.parent,
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.bottomRight,
//                         child: Text(
//                           message.getMessageDateTime!,
//                           style: TextStyle(fontSize: 15),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {},
//               child: CircleAvatar(
//                 backgroundImage: NetworkImage(message.sender!.imageUrl!),
//                 radius: MediaQuery.of(context).size.width / 20,
//               ),
//             ),
//           ],
//         ),
//       );
//     } else {
//       return Padding(
//         padding: EdgeInsets.fromLTRB(16, 16, 36, 16),
//         child: Row(
//           children: [
//             GestureDetector(
//               onTap: () {},
//               child: CircleAvatar(
//                 backgroundImage: NetworkImage(message.sender!.imageUrl!),
//                 radius: MediaQuery.of(context).size.width / 20,
//               ),
//             ),
//             Flexible(
//               child: Padding(
//                 padding: EdgeInsets.only(left: 11),
//                 child: Container(
//                   padding: EdgeInsets.all(15),
//                   decoration: BoxDecoration(
//                     color: Colors.blueAccent,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 10),
//                         child: Text(
//                           message.text!,
//                           style: TextStyle(fontSize: 20.0),
//                           textWidthBasis: TextWidthBasis.parent,
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.bottomRight,
//                         child: Text(
//                           message.getMessageDateTime,
//                           style: TextStyle(fontSize: 15),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }