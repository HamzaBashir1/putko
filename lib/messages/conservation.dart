import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Conservation extends StatefulWidget {
  const Conservation({super.key});

  @override
  State<Conservation> createState() => _ConservationState();
}

class _ConservationState extends State<Conservation> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("conversations").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        };
        return ListView(
          children: snapshot.data!.docs.map((snap) {
            return Conversation();
          }).toList(),
        );

      },
    );
  }
}

class Conversation extends StatefulWidget {
  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
