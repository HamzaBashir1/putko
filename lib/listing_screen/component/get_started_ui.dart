import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:putko/listing_screen/component/about_your_place.dart';
import 'package:putko/widget/common_button.dart';

class GetStartedUI extends StatefulWidget {
  const GetStartedUI({super.key});

  @override
  State<GetStartedUI> createState() => _GetStartedUIState();
}

class _GetStartedUIState extends State<GetStartedUI> {

  Future<void> _addMyPostingIDsToFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final postingsRef = FirebaseFirestore.instance.collection('postings');
      final querySnapshot = await postingsRef.where('createdBy', isEqualTo: user.uid).get();
      final postingIds = querySnapshot.docs.map((doc) => doc.id).toList();
      await docRef.set({'myPostingIDs': FieldValue.arrayUnion(postingIds)}, SetOptions(merge: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [


            const Row(
              children: [
                Text("It's easy to get \nstarted on Putko", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                const Padding(
                  padding: EdgeInsets.only(bottom: 34),
                  child: Column(
                    children: [
                      Text(
                        "1",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tell us about your place",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Share some basic info, like \nwhere it is and how many \nguests can stay.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Image.asset("images/bed.jpg", width: 100,height: 80,)
                    ],
                  ),
                )
                
              ],
            ),


            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
              height: 10,
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Padding(
                  padding: EdgeInsets.only(bottom: 34),
                  child: Column(
                    children: [
                      Text(
                        "2",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Make it stand out",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Add 5 ot more photos plus a \ntitle and description-We'll help\nyou out.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Image.asset("images/wradrobe.jpg", width: 100,height: 80,)
                    ],
                  ),
                )

              ],
            ),

            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
              height: 10,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Padding(
                  padding: EdgeInsets.only(bottom: 55),
                  child: Column(
                    children: [
                      Text(
                        "3",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Finish up and Publish",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Choose if you'd like to start\nwith an experienced guest, set\na starting price, and publish\nyour listing.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Image.asset("images/door.jpg", width: 100,height: 80,)
                    ],
                  ),
                )

              ],
            ),

            const Spacer(),

            CommonButton(
              buttonText: 'Get Started',
              onTap: () async {
                await _addMyPostingIDsToFirestore();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutYourPlace()),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
