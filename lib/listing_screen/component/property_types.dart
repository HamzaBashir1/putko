import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:putko/listing_screen/component/place_type.dart';

class PropertyTypes extends StatefulWidget {
  final String postingId;
  const PropertyTypes({super.key, required this.postingId});

  @override
  State<PropertyTypes> createState() => _PropertyTypesState();
}

class _PropertyTypesState extends State<PropertyTypes> {
  String? _selectedPropertyType;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _addPropertyTypeToFirestore() async {
    if (_selectedPropertyType!= null) {
      await _firestore.collection('postings').doc(widget.postingId).update({
        'propertyType': _selectedPropertyType,
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
                onPressed: _selectedPropertyType!= null
                    ? () {
                  _addPropertyTypeToFirestore();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlaceType(postingId: widget.postingId)),
                  );
                }
                    : null,
                child: Text('Next', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20,right: 20, top: 10),
          child: Column(
            children: [
              Text("Which of these best\ndescribes your place?", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              GridView.count(
                shrinkWrap: true, // Add this
                crossAxisCount: 2,
                childAspectRatio: 1, // Add this to make the grid items square
                physics: NeverScrollableScrollPhysics(),
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPropertyType = 'House';
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: _selectedPropertyType == 'House'
                              ? const Color(0xFF4FBE9F)
                              : Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home, size: 48),
                            const SizedBox(height: 16),
                            const Text('House', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPropertyType = 'Apartment';
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: _selectedPropertyType == 'Apartment'
                              ? const Color(0xFF4FBE9F)
                              : Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.apartment_outlined, size: 48),
                            const SizedBox(height: 16),
                            const Text('Apartment', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPropertyType = 'Hotel';
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: _selectedPropertyType == 'Hotel'
                              ? const Color(0xFF4FBE9F)
                              : Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.hotel, size: 48),
                            const SizedBox(height: 16),
                            const Text('Hotel', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPropertyType = 'Villa';
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: _selectedPropertyType == 'Villa'
                              ? const Color(0xFF4FBE9F)
                              : Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.villa_outlined, size: 48),
                            const SizedBox(height: 16),
                            const Text('Villa', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPropertyType = 'BnB';
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: _selectedPropertyType == 'BnB'
                              ? const Color(0xFF4FBE9F)
                              : Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bed, size: 48),
                            const SizedBox(height: 16),
                            const Text('BnB', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPropertyType = 'Resort';
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: _selectedPropertyType == 'Resort'
                              ? const Color(0xFF4FBE9F)
                              : Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.house_outlined, size: 48),
                            const SizedBox(height: 16),
                            const Text('Resort', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPropertyType = 'Cottage';
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: _selectedPropertyType == 'Cottage'
                              ? const Color(0xFF4FBE9F)
                              : Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cottage_outlined, size: 48),
                            const SizedBox(height: 16),
                            const Text('Cottage', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPropertyType = 'Mansion';
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: _selectedPropertyType == 'Mansion'
                              ? const Color(0xFF4FBE9F)
                              : Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.house_rounded, size: 48),
                            const SizedBox(height: 16),
                            const Text('Mansion', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
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