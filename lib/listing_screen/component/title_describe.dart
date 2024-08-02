import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:putko/listing_screen/component/property_description.dart';

class TitleDescribe extends StatefulWidget {
  final String postingId;
  const TitleDescribe({super.key, required this.postingId});

  @override
  State<TitleDescribe> createState() => _TitleDescribeState();
}

class _TitleDescribeState extends State<TitleDescribe> {

  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected4 = false;
  bool _isSelected5 = false;
  bool _isSelected6 = false;

  int _selectedCount = 0;

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
                  onPressed: () async {
                    List<String> highlights = [];

                    if (_isSelected1) {
                      highlights.add('Peaceful');
                    }
                    if (_isSelected2) {
                      highlights.add('Unique');
                    }
                    if (_isSelected3) {
                      highlights.add('Family-friendly');
                    }
                    if (_isSelected4) {
                      highlights.add('Stylish');
                    }
                    if (_isSelected5) {
                      highlights.add('Central');
                    }
                    if (_isSelected6) {
                      highlights.add('Spacious');
                    }

                    await _firestore.collection('postings').doc(widget.postingId).set({
                      'highlights': highlights,
                    }, SetOptions(merge: true));

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PropertyDescription(postingId: widget.postingId)),
                    );
                  },
                  child: Text('Next', style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),

        body: Container(
          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
          child: Column(
            children: [

              const Text("Next, let's describe your cabin", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),

              const Text("Choose up to 2 highlights. We'll use these to get your description started.",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey
                ),
              ),

              SizedBox(
                height: 20,
              ),


              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedCount < 2) {
                                _isSelected1 = !_isSelected1;
                                if (_isSelected1) {
                                  _selectedCount++;
                                } else {
                                  _selectedCount--;
                                }
                              }
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: _isSelected1 ? Color(0xFF4FBE9F) : Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.local_offer),
                                  SizedBox(width: 16),
                                  Text('Peaceful'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedCount < 2) {
                                _isSelected2 = !_isSelected2;
                                if (_isSelected2) {
                                  _selectedCount++;
                                } else {
                                  _selectedCount--;
                                }
                              }
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: _isSelected2 ? Color(0xFF4FBE9F) : Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.location_pin),
                                  SizedBox(width: 16),
                                  Text('Unique'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ...
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedCount < 2) {
                                _isSelected3 = !_isSelected3;
                                if (_isSelected3) {
                                  _selectedCount++;
                                } else {
                                  _selectedCount--;
                                }
                              }
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: _isSelected3 ? Color(0xFF4FBE9F) : Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.child_care),
                                  SizedBox(width: 16),
                                  Text('Family-friendly'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ...
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedCount < 2) {
                                _isSelected4 = !_isSelected4;
                                if (_isSelected4) {
                                  _selectedCount++;
                                } else {
                                  _selectedCount--;
                                }
                              }
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: _isSelected4 ? Color(0xFF4FBE9F) : Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.home_repair_service),
                                  SizedBox(width: 16),
                                  Text('Stylish'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 32),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedCount < 2) {
                                _isSelected5 = !_isSelected5;
                                if (_isSelected5) {
                                  _selectedCount++;
                                } else {
                                  _selectedCount--;
                                }
                              }
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: _isSelected5 ? Color(0xFF4FBE9F) : Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(width: 16),
                                  Text('Central'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedCount < 2) {
                                _isSelected6 = !_isSelected6;
                                if (_isSelected6) {
                                  _selectedCount++;
                                } else {
                                  _selectedCount--;
                                }
                              }
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: _isSelected6 ? Color(0xFF4FBE9F) : Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(width: 16),
                                  Text('Spacious'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )




            ],
          ),
        )
    );
  }
}
