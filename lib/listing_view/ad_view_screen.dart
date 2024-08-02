import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:putko/listing_view/review_card.dart';
import 'package:putko/messages/send_message_host.dart';
import 'package:putko/listing_view/availability.dart';
import 'package:putko/listing_view/cancellation_policy.dart';
import 'package:putko/listing_view/confirm_and_pay.dart';
import 'package:putko/listing_view/show_amenities.dart';
import 'package:putko/widget/common_button.dart';

import 'manage_host.dart';

class AdViewScreen extends StatefulWidget {
  final String id;
  const AdViewScreen({super.key, required this.id });

  @override
  State<AdViewScreen> createState() => _AdViewScreenState();
}

class _AdViewScreenState extends State<AdViewScreen> {

  QueryDocumentSnapshot? _snap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('postings').doc(widget.id).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final snap = snapshot.data!;
          final startDateTimestamp = snap['start_date'];
          final startDate = startDateTimestamp.toDate();
          final endDate = startDate.add(Duration(days: 5));

          return BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      '€${snap['price']} night',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${DateFormat('d MMM').format(startDate)} - ${DateFormat('d MMM').format(endDate)}',
                      style: TextStyle(fontSize: 16, decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ConfirmAndPay(documentSnapshot: snapshot.data!)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4FBE9F),
                    padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  child: const Text('Reserve', style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
              ],
            ),
          );
        },
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('postings').doc(widget.id).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final snap = snapshot.data!;

          return ListView(
            children: [
              PropertyDetails(documentSnapshot: snap), // Pass the DocumentSnapshot to the PropertyDetails widget
            ],
          );
        },
      ),
    );
  }
}


class PropertyDetails extends StatefulWidget {

  final DocumentSnapshot<Map<String, dynamic>> documentSnapshot;


  const PropertyDetails({super.key, required this.documentSnapshot});

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {

  User? user;
  String? username;

  File? _image;
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _getUsername();
    _loadWork();
    _loadText();
    _loadSpendTooMuchTime();
    _loadPets();
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

  String _pets = '';
  final _petsController = TextEditingController();


  Future<void> _loadPets() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnap = await docRef.get();
      if (docSnap.exists) {
        setState(() {
          _pets = docSnap['pets']?? '';
        });
        _petsController.text = _pets;
      }
    }
  }

  String _spendTooMuchTime = '';
  Future<void> _loadSpendTooMuchTime() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnap = await docRef.get();
      if (docSnap.exists) {
        setState(() {
          _spendTooMuchTime = docSnap['spend_too_much_time']?? '';
        });
      }
    }
  }

  String _text = '';

  Future<void> _loadText() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnap = await docRef.get();
      if (docSnap.exists) {
        setState(() {
          _text = docSnap['about']?? '';
        });
      }
    }
  }


  String _work = '';
  Future<void> _loadWork() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnap = await docRef.get();
      if (docSnap.exists) {
        setState(() {
          _work = docSnap['work'] ?? '';
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

  String _timeSinceCreated = '';

  Future<void> _calculateTimeSinceCreated() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnapshot = await userDoc.get();
      final createdAt = docSnapshot.get('createdAt'); // Assuming 'createdAt' is a field in the document

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

        setState(() {});
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          children: [

            Row(
              children: List.generate(widget.documentSnapshot['photos'].length, (index) {
                return Expanded(
                  child: AspectRatio(
                    aspectRatio: 3 / 2,
                    child: Image.network(widget.documentSnapshot['photos'][index], fit: BoxFit.cover),
                  ),
                );
              }),
            ),

            const SizedBox(
              height: 20,
            ),

            //get data from property_title screen
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${widget.documentSnapshot['title']} ${widget.documentSnapshot['propertyName']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.05, // Set font size based on screen width
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),


            //get data from place type and place_location screen
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('${widget.documentSnapshot['placeType']} ${widget.documentSnapshot['propertyType']} in ${widget.documentSnapshot['town']},${widget.documentSnapshot['country']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.035, // Set font size based on screen width
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 5,
            ),

            //get data from basic_your_place screen
            LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${widget.documentSnapshot['guests']} guests • ${widget.documentSnapshot['bedrooms']} bedroom • ${widget.documentSnapshot['beds']} bed • ${widget.documentSnapshot['bathrooms']} bathroom',
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04, // Set font size based on screen width
                          ),
                          textAlign: TextAlign.center, // Center the text
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),

            const SizedBox(
              height: 20,
            ),


            // Container(
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.grey, width: 1),
            //     borderRadius: const BorderRadius.all(Radius.circular(10)),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20,right: 20),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         Flexible(
            //           flex: 2,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: <Widget>[
            //               Row(
            //                 children: [
            //                   Text(
            //                     // '5.0',
            //                     '',
            //                     style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
            //                     textAlign: TextAlign.center,
            //                   ),
            //                 ],
            //               ),
            //
            //               const Row(
            //                 children: [
            //                   // Icon(Icons.star, color: Colors.amber, size: 12), // Use a fixed size for the Icon
            //                   // Icon(Icons.star, color: Colors.amber, size: 12),
            //                   // Icon(Icons.star, color: Colors.amber, size: 12),
            //                   // Icon(Icons.star, color: Colors.amber, size: 12),
            //                   // Icon(Icons.star, color: Colors.amber, size: 12),
            //                 ],
            //               )
            //             ],
            //           ),
            //         ),
            //
            //         Row(
            //
            //           children: <Widget>[
            //             Image.asset("images/guest_favorite.jpeg", width: 120,)
            //           ],
            //         ),
            //         const SizedBox(width: 28), // Use a fixed width for the SizedBox
            //         Row(
            //           children: [
            //             Text(
            //               // '49\nReviews',
            //               '',
            //               style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
            //               textAlign: TextAlign.center,
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),


            const SizedBox(
              height: 5,
            ),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: _imageUrl != null
                            ? NetworkImage(_imageUrl!)
                            : AssetImage('images/person.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded( // take the remaining space
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          username != null
                              ? Text(
                            "Hosted by $username",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          )
                              : const Text(
                            "Loading...",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Superhost',
                            style: TextStyle(fontSize: 16),
                          ),
                          const Text(
                            ' · ',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            ' $_timeSinceCreated ago.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),


            const Divider(
              thickness: 1,
              color: Colors.grey,
              height: 20,
            ),

            const SizedBox(
              height: 15,
            ),

            widget.documentSnapshot['amenities'] != null &&
                widget.documentSnapshot['amenities'].containsKey('guestFavorites') &&
                widget.documentSnapshot['amenities']['guestFavorites'].containsKey('dedicatedWorkspace') &&
                widget.documentSnapshot['amenities']['guestFavorites']['dedicatedWorkspace']
                ? const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40, // adjust the width to fit your icon
                  child: Icon(
                    Icons.desk_outlined,
                  ),
                ),
                SizedBox(width: 16), // add some space between the icon and the text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dedicated workspace',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'A common area with wifi that\'s well-suited for working.',
                      ),
                    ],
                  ),
                ),
              ],
            )
                : Container(), // show an empty container if dedicatedWorkspace is false


            const SizedBox(
              height: 15,
            ),

            widget.documentSnapshot['reservationType'] == "Use Instant Book"
                ? const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40, // adjust the width to fit your icon
                  child: Icon(
                    Icons.door_front_door_outlined,
                  ),
                ),
                SizedBox(width: 16), // add some space between the icon and the text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Self check-in',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Check yourself in with the lockbox.',
                      ),
                    ],
                  ),
                ),
              ],
            )
                : Container(), // or SizedBox.shrink() to take up no space


            const SizedBox(
              height: 15,
            ),

            // const Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     SizedBox(
            //       width: 40, // adjust the width to fit your icon
            //       child: Icon(
            //         Icons.calendar_month,
            //       ),
            //     ),
            //     SizedBox(width: 16), // add some space between the icon and the text
            //     Expanded(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             'Free Cancellation {specific date}',
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           Text(
            //             'Get a full refund if you change your mind.',
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),

            const SizedBox(
              height: 15,
            ),

            const Divider(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.only(top: 20,bottom: 10),
              child: Column(
                children: [

                  Text("${widget.documentSnapshot['description']}",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            const Divider(
              thickness: 1,
              color: Colors.grey,
              height: 20,
            ),

            const Padding(
              padding: EdgeInsets.only(top: 10,bottom: 20),
              child: Row(
                children: [

                  Text("What this place offers", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),


                ],
              ),
            ),

        widget.documentSnapshot['amenities'] != null &&
            widget.documentSnapshot['amenities'].containsKey('guestFavorites') &&
            widget.documentSnapshot['amenities']['guestFavorites'].containsKey('kitchen') &&
            widget.documentSnapshot['amenities']['guestFavorites']['kitchen']
            ?
            const Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.kitchen)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Text("Kitchen",style: TextStyle(fontSize: 18),)
                    ],
                  ),
                ),
              ],
            )
            : Container(),

            const SizedBox(
              height: 10,
            ),

            widget.documentSnapshot['amenities'] != null &&
                widget.documentSnapshot['amenities'].containsKey('guestFavorites') &&
                widget.documentSnapshot['amenities']['guestFavorites'].containsKey('wifi') &&
                widget.documentSnapshot['amenities']['guestFavorites']['wifi']
                ?
            const Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.wifi)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Text("Wifi",style: TextStyle(fontSize: 18),)
                    ],
                  ),
                ),
              ],
            )
              :Container(),

            const SizedBox(
              height: 10,
            ),

            widget.documentSnapshot['amenities'] != null &&
                widget.documentSnapshot['amenities'].containsKey('guestFavorites') &&
                widget.documentSnapshot['amenities']['guestFavorites'].containsKey('dedicatedWorkspace') &&
                widget.documentSnapshot['amenities']['guestFavorites']['dedicatedWorkspace']
                ?
            const Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.desk_outlined)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Text("Dedicated Workspace",style: TextStyle(fontSize: 18),)
                    ],
                  ),
                ),
              ],
            )
              : Container(),

            const SizedBox(
              height: 10,
            ),

            widget.documentSnapshot['amenities'] != null &&
                widget.documentSnapshot['amenities'].containsKey('guestFavorites') &&
                widget.documentSnapshot['amenities']['guestFavorites'].containsKey('freeParking') &&
                widget.documentSnapshot['amenities']['guestFavorites']['freeParking']
                ?
            const Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.drive_eta_rounded)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Text("Free Parking on premises",style: TextStyle(fontSize: 18),)
                    ],
                  ),
                ),
              ],
            )
              : Container(),

            const SizedBox(
              height: 10,
            ),

            widget.documentSnapshot['amenities'] != null &&
                widget.documentSnapshot['amenities'].containsKey('standoutAmenities') &&
                widget.documentSnapshot['amenities']['standoutAmenities'].containsKey('pool') &&
                widget.documentSnapshot['amenities']['standoutAmenities']['pool']
                ?
            const Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.pool)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Text("Lake View",style: TextStyle(fontSize: 18),)
                    ],
                  ),
                ),
              ],
            )
              : Container(),

            const SizedBox(
              height: 20,
            ),

            CommonButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>   ShowAmenities(documentSnapshot: widget.documentSnapshot)),
                );
              },
              buttonText: "Show all 30 amenities",
            ),

            const Divider(
              thickness: 1,
              color: Colors.grey,
              height: 20,
            ),

            const SizedBox(
              height: 20,
            ),

            const Column(
              children: [
                Row(
                  children: [
                    Text("Where you'll be", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ],
                )
              ],
            ),

            const Padding(
              padding: EdgeInsets.only(top: 10,bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Complete address of property",style: TextStyle(fontSize: 18),),
                    ],
                  )
                ],
              ),
            ),

            Image.asset("images/map.jpeg"),

            const SizedBox(
              height: 20,
            ),

            Container(
              color: const Color(0xFFfaf7f0),
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '4.98',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Guest favorite',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'This home is in the top 10% of eligible listings based on ratings, reviews, and reliability',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),


                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       height: 300, // provide a fixed height
            //       child: PageView.builder(
            //         itemCount: 2, // number of ReviewCard widgets
            //         itemBuilder: (context, index) {
            //           if (index == 0) {
            //             return ReviewCard(
            //               rating: 5,
            //               date: '1 week ago',
            //               review: 'I recommend 100%, beautiful accommodation in beautiful surroundings',
            //               author: 'Melisa',
            //               yearsOnAirbnb: 3,
            //             );
            //           } else {
            //             return ReviewCard(
            //               rating: 5,
            //               date: '',
            //               review: 'Everyth\nCommu\nThanks',
            //               author: '',
            //               yearsOnAirbnb: null,
            //             );
            //           }
            //         },
            //       ),
            //       decoration: const BoxDecoration(
            //         color: Color(0xFFfaf7f0), // set the background color
            //       ),
            //     ),
            //     const SizedBox(height: 40), // add space at the bottom
            //   ],
            // ),


            const Column(
              children: [

                Row(
                  children: [
                    Text("Meet your Host", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                  ],
                )

              ],
            ),

            const SizedBox(
              height: 20,
            ),

            Card(
              elevation: 10, // add shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // add border radius
              ),
              color: Colors.white, // set background color to white
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20), // add padding top and bottom
                child: Row(
                  children: [
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100, // adjust the width to your liking
                          height: 100, // adjust the height to your liking
                          child: ClipOval(
                            child: _imageUrl != null
                                ? Image.network(_imageUrl!, fit: BoxFit.cover)
                                : Image.asset('images/person.png', fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          username ?? '',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star),
                            SizedBox(width: 5),
                            Text(
                              'Superhost',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const Spacer(),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '10',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Reviews',
                          style: TextStyle(fontSize: 16),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '4.98',
                              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.star, color: Colors.amber, size: 24),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Rating',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 20,
                        ),
                        Text(
                          '1',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Months hosting',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const Spacer()

                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

        Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Row(
                  children: [
                    Column(
                      children: [
                        Icon(Icons.language, ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Speaks English'),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Column(
                      children: [
                        Icon(Icons.location_on, ),
                      ],
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              _work!= null && _work.isNotEmpty? _work : '',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),


                const SizedBox(height: 32.0),
                Text(_spendTooMuchTime?? ''),
                SizedBox(height: 32.0),
                Text(_text?? ''),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Text("${username ?? ''} is a superhost",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            const Column(
              children: [
                Text("Superhosts are experienced, highly rated hosts who are commited to providing great stays for guests."),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            CommonButton(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ManageHost(documentSnapshot: widget.documentSnapshot)),
                );
              },
              buttonText: "Manage Host",
            ),

            const Padding(
              padding: EdgeInsets.only(top: 10,bottom: 20),
              child: Row(
                children: [


                  Column(
                    children: [
                      Icon(Icons.payments),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Text("To protect your payment, never transfer money \nor communicate outside of the Putko website or \napp", style: TextStyle(color: Colors.grey,fontSize: 12),),
                      ],
                    ),
                  ),


                ],
              ),
            ),

            const Divider(height: 20,thickness: 1,color: Colors.grey,),

            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Availability(documentSnapshot: widget.documentSnapshot)),
                );
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Availability',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'Sep 8 - 13',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),

            const Divider(
              thickness: 1,
              color: Colors.grey,
              height: 20,
            ),

            // GestureDetector(
            //   onTap: (){
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const CancellationPolicy()),
            //     );
            //   },
            //   child: const Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Cancellation policy',
            //         style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       SizedBox(height: 5),
            //       Text(
            //         'Free cancellation before Aug 9.',
            //         style: TextStyle(fontSize: 16),
            //       ),
            //       SizedBox(height: 5),
            //       Text(
            //         'Review the Host\'s full cancellation policy which applies even if you cancel for illness or disruptions.',
            //         style: TextStyle(fontSize: 16),
            //       ),
            //
            //     ],
            //   ),
            // ),
            //
            // const Divider(
            //   thickness: 1,
            //   color: Colors.grey,
            //   height: 20,
            // ),

            GestureDetector(
              onTap: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Availabil()),
                // );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'House rules',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        'Check-in after ${widget.documentSnapshot['check_in_time']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        "Checkout before ${widget.documentSnapshot['check_out_time']}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        "${widget.documentSnapshot['guests']} guests maximum",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(
              thickness: 1,
              color: Colors.grey,
              height: 20,
            ),

            GestureDetector(
              onTap: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Availabil()),
                // );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Safety & property',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  widget.documentSnapshot['amenities']?.containsKey('safetyItems') == true &&
                      widget.documentSnapshot['amenities']['safetyItems']?.containsKey('carbonMonoxideAlarm') == true &&
                      widget.documentSnapshot['amenities']['safetyItems']['carbonMonoxideAlarm'] == true
                      ? Row(
                    children: [
                      Text(
                        'Carbon monoxide alarm reported',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                      : Row(
                    children: [
                      Text(
                        'Carbon monoxide alarm not reported',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  widget.documentSnapshot['amenities']?.containsKey('safetyItems') == true &&
                      widget.documentSnapshot['amenities']['safetyItems']?.containsKey('SmokeAlarm') == true &&
                      widget.documentSnapshot['amenities']['safetyItems']['SmokeAlarm'] == true
                      ? Row(
                    children: [
                      Text(
                        'Smoke alarm reported',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                      : Row(
                    children: [
                      Text(
                        'Smoke alarm not reported',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  widget.documentSnapshot['amenities']?.containsKey('guestFavorites') == true &&
                      widget.documentSnapshot['amenities']['guestFavorites']?.containsKey('pet') == true &&
                      widget.documentSnapshot['amenities']['guestFavorites']['pet'] == true
                      ? Row(
                    children: [
                      Text(
                        'Pet(s) live on property',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                      : Row(
                    children: [
                      Text(
                        'No pet(s) on property',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(
              thickness: 1,
              color: Colors.grey,
              height: 20,
            ),

            const SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}
