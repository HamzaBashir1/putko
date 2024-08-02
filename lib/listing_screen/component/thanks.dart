import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:putko/today_screen/today_screen.dart';
import 'package:putko/widget/common_button.dart';
import 'package:putko/widget/host_home_screen.dart';

import '../listings.dart';

class Thanks extends StatefulWidget {
  const Thanks({super.key});

  @override
  State<Thanks> createState() => _ThanksState();
}

class _ThanksState extends State<Thanks> {

  User? user;
  String? username;


  @override
  void initState() {
    super.initState();
    _getUsername();
  }


  _getUsername() async {
    user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final userData = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
      setState(() {
        username = userData.get('username'); // Use get() method to retrieve data from Firestore
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
      // bottomNavigationBar: HostNavbar(),
      body: Container(
        margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
        child: Column(
          children: [

            const SizedBox(
              height: 20,
            ),

            const Spacer(),

            Text("Congratulations, ${username?? ''}", style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),), // Use string interpolation to display username

            const Text("From one Host to another - welcome abroad. Thanks you for sharing your home and helping to create incredible experiences for our guests.",
              style: TextStyle(
                  fontSize: 16
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            CommonButton(
              buttonText: "Let's get started",
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HostHomeScreen()),
                );
              },
            ),

            const Spacer(),

          ],
        ),
      ),
    );
  }
}