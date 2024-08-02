import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../messages/send_message_host.dart';


class ManageHost extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> documentSnapshot;
  const ManageHost({super.key, required this.documentSnapshot});

  @override
  State<ManageHost> createState() => _ManageHostState();
}

class _ManageHostState extends State<ManageHost> {

  // conversation() {
  //   conversationModel conversation = ConversationModel();
  //   conversation.addConversationToFirestore(currentUser)
  // }


  User? user;
  String? username;

  File? _image;
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
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: Colors.grey),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Still have a questions?', style: TextStyle(color: Colors.black,),),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4FBE9F), // Add background color
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SendMessageHost(documentSnapshot: widget.documentSnapshot)),
                  );
                },
                child: const Text('Message Host', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20,right: 20),
          child:  Column(
            children: [

              Row(

                children: <Widget>[

                  Column(
                    children: [
                      Text(
                        'Contact $username',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        'Typically responds within an hour',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,

                        ),
                      ),
                    ],
                  ),

                  Spacer(),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30.0, // adjust the radius to your liking
                        backgroundImage: _imageUrl!= null
                            ? NetworkImage(_imageUrl!)
                            : AssetImage('images/person.png') as ImageProvider,
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),

              Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Row(
                  children: [
                    Text("Most travelers ask about",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),



              Row(
                children: [
                  Text("Getting there", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                ],
              ),

              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(" • ${widget.documentSnapshot != null ? (widget.documentSnapshot.exists && widget.documentSnapshot['amenities']['guestFavorites'] != null && widget.documentSnapshot['amenities']['guestFavorites'].containsKey('freeParking') ? 'Free' : 'Paid') : 'Unknown'} Parking on the premises.", style: TextStyle(fontSize: 16),),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(" • Check-in time for this home starts at ${widget.documentSnapshot['check_in_time']} and checkout is at ${widget.documentSnapshot['check_out_time']}", style: TextStyle(fontSize: 16),),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Row(
                  children: [
                    Text("House details and rules", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  ],
                ),
              ),

              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(" • ${widget.documentSnapshot['amenities']['guestFavorites']['smokeallow'] == true? 'Smoke allowed' : 'No smoking'}. No parties or events. ${widget.documentSnapshot['amenities']['guestFavorites']['pet'] == true? 'Pet allowed' : 'No pets'}", style: TextStyle(fontSize: 16),),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Row(
                  children: [
                    Text("Price and availability",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  ],
                ),
              ),

              Row(
                children: [
                  Expanded(child: Text("Get a 10% discount on stays longer than a week, or 20% on stays longer than a month.", style: TextStyle(fontSize: 16),)),
                ],
              ),
              SizedBox(
                height: 5,
              ),

              Row(
                children: [
                  Expanded(child: Text("Cancel up to 5 days before check-in and get a full refund. After that, cancel before check-in and get a 50% refund, minus the first night and service fees", style: TextStyle(fontSize: 16),)),
                ],
              ),

              SizedBox(height: 20),

              Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),

              Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Row(
                  children: [
                    Text("This home is available Sep 8 - 13.", style: TextStyle(fontSize: 16),),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}