import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'basic_your_place.dart';

class PlaceLocation extends StatefulWidget {
  final String postingId;

  const PlaceLocation({super.key, required this.postingId});

  @override
  State<PlaceLocation> createState() => _PlaceLocationState();
}

class _PlaceLocationState extends State<PlaceLocation> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(37.42796133580664, -122.085749655962);

  final Set<Marker> _markers = {};

  final _formKey = GlobalKey<FormState>();

  final flatFloorBldgController = TextEditingController();
  final propertyNameController = TextEditingController();
  final streetAddressController = TextEditingController();
  final countryController = TextEditingController();
  final townController = TextEditingController();
  final postcodeController = TextEditingController();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the form
                    // print('Form submitted successfully!');
                    _addPlaceLocationToFirestore();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BasicYourPlace(postingId: widget.postingId)),
                    );
                  }
                },
                child: Text('Next', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text("Where's your place \nlocated?", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ],
              ),
              Text("your address is only shared with guests after they've made a reservation.",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: flatFloorBldgController,
                        decoration: InputDecoration(
                          labelText: 'Flat, floor, bldg (if applicable)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your flat, floor, or building number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: propertyNameController,
                        decoration: InputDecoration(
                          labelText: 'Property name (if applicable)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your property name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: streetAddressController,
                        decoration: InputDecoration(
                          labelText: 'Street address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your street address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: countryController,
                        decoration: InputDecoration(
                          labelText: 'Country (if applicable)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Country';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: townController,
                        decoration: InputDecoration(
                          labelText: 'Town',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your town';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: postcodeController,
                        decoration: InputDecoration(
                          labelText: 'Postcode',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your postcode';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 32.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addPlaceLocationToFirestore() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final postingRef = _firestore.collection('postings').doc(widget.postingId);

    // Get the form values
    final flatFloorBldg = flatFloorBldgController.text;
    final propertyName = propertyNameController.text;
    final streetAddress = streetAddressController.text;
    final country = countryController.text;
    final town = townController.text;
    final postcode = postcodeController.text;

    // Add the place location to Firestore
    await postingRef.set({
      'flatFloorBldg': flatFloorBldg,
      'propertyName': propertyName,
      'treetAddress': streetAddress,
      'country': country,
      'town': town,
      'postcode': postcode,
    }, SetOptions(merge: true));
  }
}