import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat_service.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: StreamBuilder<ChatData>(
        stream: ChatService().getChats(FirebaseAuth.instance.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 1, // Since we're getting a single ChatData object
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data!.message),
                  subtitle: Text(snapshot.data?.senderId == FirebaseAuth.instance.currentUser?.uid? 'You' : 'Guest'),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}