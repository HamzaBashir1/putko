import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:putko/listing_screen/component/property_types.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AboutYourPlace extends StatefulWidget {
  const AboutYourPlace({super.key});

  @override
  State<AboutYourPlace> createState() => _AboutYourPlaceState();
}

class _AboutYourPlaceState extends State<AboutYourPlace> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> _addPostingInfoToFirestore() async {
    final user = _auth.currentUser;
    if (user != null) {
      final postingId = await _firestore.collection('postings').doc().id;
      await _firestore.collection('postings').doc(postingId).set({
        'propertyType': "",
        'placeType': "",
        'price': '',
        'description': '',
        'bathrooms': '',
        'bedrooms': '',
        'beds': '',
        'guests': '',
        'country': '',
        'postcode': '',
        'town': '',
        'weapons': '',
        'ownerId': user.uid,
        'postingId': postingId,
        // Add other fields here
      }, SetOptions(merge: true));

      // Add posting ID to user's document
      final userRef = _firestore.collection('users').doc(user.uid);
      await userRef.update({'myPostingIDs': FieldValue.arrayUnion([postingId])});

      return postingId;
    } else {
      return '';
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
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: Colors.grey),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to previous screen
                },
                child: Text('Back', style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4FBE9F), // Add background color
                ),
                onPressed: () async {
                  final postingId = await _addPostingInfoToFirestore();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PropertyTypes(postingId: postingId)),
                  );
                },
                child: Text('Next', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Spacer(),
            const Row(
              children: [
                Text("Step 1", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),),
              ],
            ),
            const Row(
              children: [
                Text("Tell us about \nyour place", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
              ],
            ),
            const Text("In this step, we'll ask you which type of property you have and if guests will book the entire place or just a room. Then let us know the location and how many guests can stay.",
              style: TextStyle(fontSize: 16),),
          ],
        ),
      ),
    );
  }
}