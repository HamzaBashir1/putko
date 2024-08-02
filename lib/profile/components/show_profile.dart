import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:putko/profile/components/create_profile.dart';
import 'package:putko/profile/components/get_the_badge.dart';
import 'package:putko/widget/common_button.dart';

class ShowProfile extends StatefulWidget {
  const ShowProfile({super.key});

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  bool _isHosting = false; // Initialize _isHosting to false for new users
  bool _isEmailVerified = true; // Initialize _isEmailVerified to true or false based on the user's email verification status
  bool _isPhoneVerified = true; // Initialize _isPhoneVerified to true or false based on the user's phone verification status
  String? _firstName;
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    _loadImageFromFirestore();
    _checkIfUserIsHosting();
    _checkVerificationStatus();
    _calculateTimeSinceCreated();
    _getUsername();
  }

  Future<void> _checkVerificationStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _isEmailVerified = user.emailVerified;
      if (user.phoneNumber != null) {
        _isPhoneVerified = true;
      } else {
        _isPhoneVerified = false;
      }
      setState(() {});
    }
  }

  Future<void> _loadImageFromFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnap = await docRef.get();
      if (docSnap.exists) {
        setState(() {
          imageUrl = docSnap['image_url'];
        });
      }
    }
  }

  Future<void> _checkIfUserIsHosting() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final uid = user.uid;
      final docRef = FirebaseFirestore.instance.collection('users').doc(uid);
      final userData = await docRef.get();
      bool currentIsHosting = userData.get('isHost');

      setState(() {
        _isHosting = currentIsHosting ?? false;
      });
    }
  }

  String _timeSinceCreated = '';

  Future<void> _calculateTimeSinceCreated() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);
      try {
        final docSnapshot = await userDoc.get();
        if (docSnapshot.exists) {
          final createdAt = docSnapshot.get('createdAt');
          if (createdAt != null) {
            final timestamp = (createdAt as Timestamp).toDate();

            final now = DateTime.now();
            final difference = now.difference(timestamp);

            final daysSinceCreated = difference.inDays;
            final monthsSinceCreated = (difference.inDays / 30).floor();
            final yearsSinceCreated = (difference.inDays / 365).floor();

            if (yearsSinceCreated > 0) {
              _timeSinceCreated = '$yearsSinceCreated year${yearsSinceCreated > 1 ? 's' : ''}';
              if (monthsSinceCreated % 12 > 0) {
                _timeSinceCreated += ' ${monthsSinceCreated % 12} month${monthsSinceCreated % 12 > 1 ? 's' : ''}';
              }
            } else if (monthsSinceCreated > 0) {
              _timeSinceCreated = '$monthsSinceCreated month${monthsSinceCreated > 1 ? 's' : ''}';
              if (daysSinceCreated % 30 > 0) {
                _timeSinceCreated += ' ${daysSinceCreated % 30} day${daysSinceCreated % 30 > 1 ? 's' : ''}';
              }
            } else {
              _timeSinceCreated = '$daysSinceCreated day${daysSinceCreated > 1 ? 's' : ''}';
            }

            setState(() {}); // Call setState to trigger a rebuild
          } else {
            print('createdAt field does not exist');
          }
        } else {
          print('Document does not exist');
        }
      } catch (e) {
        print('Error getting document: $e');
      }
    } else {
      print('User is not logged in');
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        flexibleSpace: Stack(
          children: [
            Positioned(
              top: 40,
              right: 8.0,
              child: ElevatedButton(
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateProfile()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Center(
                      child: Container(
                        width: 200,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            imageUrl != null
                                ? CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(imageUrl!),
                            )
                                : CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.black,
                              child: Text(
                                'P',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              username ?? 'Loading...',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _isHosting ? 'Host' : 'Guest',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _timeSinceCreated.isEmpty? 'Loading...' : '1 $_timeSinceCreated ago.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'on Putko',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    "${username ?? 'Username not available'} Confirmed",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CheckboxListTile(
                      title: const Text('Email address'),
                      value: _isEmailVerified,
                      onChanged: (value) {},
                    ),
                    CheckboxListTile(
                      title: const Text('Phone number'),
                      value: _isPhoneVerified,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 1,
                height: 20,
                color: Colors.grey,
              ),
              const SizedBox(height: 25),
              const Row(
                children: [
                  Text(
                    "Identity verification",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      "Show other you're really you with the \nidentity verification badge.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black),
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), // Add this line
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   PageRouteBuilder(
                      //     pageBuilder: (context, animation, secondaryAnimation) => const GetTheBadge(),
                      //   ),
                      // );
                    },
                    child: const Text("Get the badge"),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                height: 20,
                color: Colors.grey,
              ),
              const SizedBox(height: 25),
              const Row(
                children: [
                  Text(
                    "It's time to create your Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Your Putko profile is an important part of every\nreservation. Create yours to help other Hosts\nand guests get to know you.",
                      style: TextStyle(
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 20),
                child: CommonButton(
                  buttonText: "Create Profile",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CreateProfile()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}