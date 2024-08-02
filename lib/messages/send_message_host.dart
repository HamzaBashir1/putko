import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:putko/listing_screen/component/photos.dart';
import 'package:putko/messages/inbox_screen.dart';
import 'package:putko/widget/common_button.dart';

class SendMessageHost extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> documentSnapshot;
  const SendMessageHost({super.key, required this.documentSnapshot});

  @override
  State<SendMessageHost> createState() => _SendMessageHostState();
}

class _SendMessageHostState extends State<SendMessageHost> {
  int index = 0;
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
    _getUsername();
  }
  User? user;
  String? username;


  _getUsername() async {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
      setState(() {
        username = userData['username'];
      });
    }
  }

  void _getCurrentUser() async {
    _currentUser = _auth.currentUser;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Experience in ${widget.documentSnapshot["town"]}",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.documentSnapshot["title"]}",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.network(
                      widget.documentSnapshot['photos'][index],
                      width: 100,
                      height: 100,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Dates",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Sep 8 - 13",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Guests",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "${widget.documentSnapshot['guests']} guest",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 20,
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Message the Host",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Hi ${username}! I'll be visiting...",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: _controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a message';
                      }
                      return null;
                    },
                    maxLines: 3,
                  ),
                )
              ],
            ),
            Spacer(),
            Divider(
              thickness: 1,
              color: Colors.grey,
              height: 20,
            ),
            CommonButton(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await FirebaseFirestore.instance.collection('conversations').doc().set({
                    'message': _controller.text,
                    'sender': _currentUser?.uid, // replace with the actual sender's ID or name
                    'timestamp': Timestamp.now(),
                    'userId': _currentUser?.uid
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InboxScreen(documentSnapshot: widget.documentSnapshot)),
                  );
                }
              },
              buttonText: "Send Message",
            ),
          ],
        ),
      ),
    );
  }
}