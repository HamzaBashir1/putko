import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConservationScreen extends StatefulWidget {
  const ConservationScreen({super.key, String? conservationId});

  @override
  State<ConservationScreen> createState() => _ConservationScreenState();
}

class _ConservationScreenState extends State<ConservationScreen> {
  final TextEditingController _controller = TextEditingController();
  User? _currentUser;
  String? _conservationId;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() async {
    _currentUser = FirebaseAuth.instance.currentUser;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
            "Name"
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('conservation/$_conservationId/messages').orderBy('dateTime').snapshots(),
              builder: (context, snapshots) {
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot snapshot = snapshots.data!.docs[index];
                      Timestamp lastMessageTimeStamp = snapshot['dateTime']?? Timestamp.now();
                      DateTime dateTime = lastMessageTimeStamp.toDate();
                      String senderID = snapshot["senderID"]?? "";
                      String text = snapshot['text']?? "";

                      if (senderID == _currentUser?.uid) {
                        // This is a message from the current user
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(text),
                            ),
                          ),
                        );
                      } else {
                        // This is a message from another user
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(text),
                            ),
                          ),
                        );
                      }
                    },
                  );
                }
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black
                )
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 5/6,
                  child: TextField(
                    decoration: const InputDecoration(
                        hintText: 'Write a message',
                        contentPadding: EdgeInsets.all(20.0),
                        border: InputBorder.none
                    ),
                    minLines: 1,
                    maxLines: 5,
                    style: const TextStyle(
                        fontSize: 20.0
                    ),
                    controller: _controller,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    if (_controller.text.isNotEmpty) {
                      await FirebaseFirestore.instance.collection('conservation/$_conservationId/messages').add({
                        'text': _controller.text,
                        'senderID': _currentUser?.uid,
                        'dateTime': Timestamp.now(),
                      });
                      _controller.clear();
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}