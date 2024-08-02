import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:putko/listing_screen/component/amenities.dart';

class BasicYourPlace extends StatefulWidget {
  final String postingId;
  const BasicYourPlace({super.key, required this.postingId});

  @override
  State<BasicYourPlace> createState() => _BasicYourPlaceState();
}

class _BasicYourPlaceState extends State<BasicYourPlace> {

  int _guests = 4;
  int _bedrooms = 1;
  int _beds = 1;
  int _bathrooms = 1;

  void _incrementGuests() {
    setState(() {
      _guests++;
    });
  }

  void _decrementGuests() {
    setState(() {
      if (_guests > 0) {
        _guests--;
      }
    });
  }

  void _incrementBedrooms() {
    setState(() {
      _bedrooms++;
    });
  }

  void _decrementBedrooms() {
    setState(() {
      if (_bedrooms > 0) {
        _bedrooms--;
      }
    });
  }

  void _incrementBeds() {
    setState(() {
      _beds++;
    });
  }

  void _decrementBeds() {
    setState(() {
      if (_beds > 0) {
        _beds--;
      }
    });
  }


  void _incrementBathrooms() {
    setState(() {
      _bathrooms++;
    });
  }

  void _decrementBathrooms() {
    setState(() {
      if (_bathrooms > 0) {
        _bathrooms--;
      }
    });
  }

  Future<void> _addBasicInfoToFirestore() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final postingRef = _firestore.collection('postings').doc(widget.postingId);

    // Add the basic info to Firestore
    await postingRef.set({
      'guests': _guests,
      'bedrooms': _bedrooms,
      'beds': _beds,
      'bathrooms': _bathrooms,
    }, SetOptions(merge: true));
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
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to previous screen
                },
                child: const Text('Back', style: TextStyle(color: Colors.black,decoration: TextDecoration.underline),),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4FBE9F), // Add background color
                ),
                onPressed: () async
                {
                  await _addBasicInfoToFirestore();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Amenities(postingId: widget.postingId)),
                  );
                },
                // onPressed: _selectedPlaceType!= null
                //     ? () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => BasicYourPlace()),
                //   );
                // }
                //     : null,
                child: const Text('Next', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Column(
          children: [



            const Text("Share some basics about your place", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

            const Text("you'll add more details later, like bed types.",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        'Guests',
                        style: TextStyle(fontSize: 20),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _decrementGuests,
                        icon: const Icon(Icons.remove_circle),
                      ),
                      Text(
                        '$_guests',
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        onPressed: _incrementGuests,
                        icon: const Icon(Icons.add_circle),
                      ),
                    ],
                  ),

                ],
              ),
            ),

            const Divider(
              thickness: 1,
              height: 20,
              color: Colors.grey,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        'Bedrooms',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _decrementBedrooms,
                        icon: const Icon(Icons.remove_circle),
                      ),
                      Text(
                        '$_bedrooms',
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        onPressed: _incrementBedrooms,
                        icon: const Icon(Icons.add_circle),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            const Divider(
              thickness: 1,
              height: 20,
              color: Colors.grey,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        'Beds',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _decrementBeds,
                        icon: const Icon(Icons.remove_circle),
                      ),
                      Text(
                        '$_beds',
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        onPressed: _incrementBeds,
                        icon: const Icon(Icons.add_circle),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            const Divider(
              thickness: 1,
              height: 20,
              color: Colors.grey,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        'Bathrooms',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _decrementBathrooms,
                        icon: const Icon(Icons.remove_circle),
                      ),
                      Text(
                        '$_bathrooms',
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        onPressed: _incrementBathrooms,
                        icon: const Icon(Icons.add_circle),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
