import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:putko/messages/conservation_screen.dart';

import 'conservation.dart';

class InboxScreen extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> documentSnapshot;
  const InboxScreen({super.key, required this.documentSnapshot});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  User? user;
  String? username;
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _getUsername();
    _loadImageFromFirestore();
  }

  Future<void> _loadImageFromFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnap = await docRef.get();
      if (docSnap.exists) {
        setState(() {
          _imageUrl = docSnap['image_url'];
        });
      }
    }
  }

  _getUsername() async {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
      setState(() {
        username = userData['username'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("Inbox Screen")),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Conservation()),
            );
          },
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      _imageUrl != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: NetworkImage(_imageUrl!),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                          : Center(child: CircularProgressIndicator()), // Add a loading indicator
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text("${widget.documentSnapshot["title"]}"),
                      Row(
                        children: [
                          Text("$username"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              
              
              
            ],
          ),
        ),
      ),
    );
  }
}

