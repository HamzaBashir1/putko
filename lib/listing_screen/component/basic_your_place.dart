import 'package:flutter/material.dart';
import 'package:putko/listing_screen/component/amenities.dart';

class BasicYourPlace extends StatefulWidget {
  const BasicYourPlace({super.key});

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
                onPressed: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Amenities()),
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



            Text("Share some basics about your place", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

            Text("you'll add more details later, like bed types.",
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
                  Column(
                    children: [
                      Text(
                        'Guests',
                        style: TextStyle(fontSize: 20),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _decrementGuests,
                        icon: Icon(Icons.remove_circle),
                      ),
                      Text(
                        '$_guests',
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        onPressed: _incrementGuests,
                        icon: Icon(Icons.add_circle),
                      ),
                    ],
                  ),

                ],
              ),
            ),

            Divider(
              thickness: 1,
              height: 20,
              color: Colors.grey,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                        icon: Icon(Icons.remove_circle),
                      ),
                      Text(
                        '$_bedrooms',
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        onPressed: _incrementBedrooms,
                        icon: Icon(Icons.add_circle),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            Divider(
              thickness: 1,
              height: 20,
              color: Colors.grey,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                        icon: Icon(Icons.remove_circle),
                      ),
                      Text(
                        '$_beds',
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        onPressed: _incrementBeds,
                        icon: Icon(Icons.add_circle),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            Divider(
              thickness: 1,
              height: 20,
              color: Colors.grey,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                        icon: Icon(Icons.remove_circle),
                      ),
                      Text(
                        '$_bathrooms',
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        onPressed: _incrementBathrooms,
                        icon: Icon(Icons.add_circle),
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
