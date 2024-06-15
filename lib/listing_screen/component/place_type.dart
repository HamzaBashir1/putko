import 'package:flutter/material.dart';
import 'package:putko/listing_screen/component/basic_your_place.dart';
import 'package:putko/listing_screen/component/place_location.dart';

class PlaceType extends StatefulWidget {
  const PlaceType({super.key});

  @override
  State<PlaceType> createState() => _PlaceTypeState();
}

class _PlaceTypeState extends State<PlaceType> {
  String? _selectedPlaceType;
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
                onPressed: _selectedPlaceType!= null
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlaceLocation()),
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
                Text("What type of place will \nguests have?", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ],
            ),


            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedPlaceType = 'An entire place';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: _selectedPlaceType == 'An entire place'
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
                            'An entire place',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Guests have the whole place to \nthemselves.',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.home,
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
                    _selectedPlaceType = 'A room';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: _selectedPlaceType == 'A room'
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
                            'A room',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Guests have their own room in a \nhome, plus access to shared \nspaces.',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.door_front_door_outlined,
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
                    _selectedPlaceType = 'A shared room';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: _selectedPlaceType == 'A shared room'
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
                            'A shared room',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Guests sleep in a room or common \narea that may be shared with you \nor others.',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.people,
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
