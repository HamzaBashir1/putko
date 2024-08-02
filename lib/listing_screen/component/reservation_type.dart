import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:putko/listing_screen/component/guest_type.dart';

class ReservationType extends StatefulWidget {
  final String postingId;
  const ReservationType({super.key, required this.postingId});

  @override
  State<ReservationType> createState() => _ReservationTypeState();
}

class _ReservationTypeState extends State<ReservationType> {

  String? _selectedReservationType;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
                child: Text('Back', style: TextStyle(color: Colors.black,decoration: TextDecoration.underline),),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4FBE9F), // Add background color
                ),
                onPressed: _selectedReservationType!= null
                    ? () async {
                  await _firestore.collection('postings').doc(widget.postingId).set({
                    'reservationType': _selectedReservationType,
                  }, SetOptions(merge: true));

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GuestType(postingId: widget.postingId)),
                  );
                }
                    : null,
                child: Text('Next', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Column(
          children: [



            Row(
              children: [
                Text("Decide how you'll confirm \nreservations", style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
              ],
            ),


            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedReservationType = 'Use Instant Book';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: _selectedReservationType == 'Use Instant Book'
                        ? const Color(0xFF4FBE9F)
                        : Colors.grey
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Add this
                        children: [
                          Text(
                            'Use Instant Book',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Guest can book automatically.',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.energy_savings_leaf_outlined,
                        size: 40.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedReservationType = 'Approve or decline requests';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: _selectedReservationType == 'Approve or decline requests'
                        ? const Color(0xFF4FBE9F)
                        : Colors.grey
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Add this
                        children: [
                          Text(
                            'Approve or decline requests',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Guests must ask if they can book.',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.message_outlined,
                        size: 40.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),





          ],
        ),
      ),
    );
  }
}