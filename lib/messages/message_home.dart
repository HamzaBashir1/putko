import 'package:flutter/material.dart';

class MessageHome extends StatefulWidget {
  const MessageHome({super.key});

  @override
  State<MessageHome> createState() => _MessageHomeState();
}

class _MessageHomeState extends State<MessageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
