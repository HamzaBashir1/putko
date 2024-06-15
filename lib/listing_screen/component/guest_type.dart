import 'package:flutter/material.dart';
import 'package:putko/listing_screen/component/price.dart';

class GuestType extends StatefulWidget {
  const GuestType({super.key});

  @override
  State<GuestType> createState() => _GuestTypeState();
}

class _GuestTypeState extends State<GuestType> {

  String? _selectedGuestType;

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
                onPressed: _selectedGuestType!= null
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Price()),
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
        margin: EdgeInsets.only(left: 20,right: 20,top: 10),
        child: Column(
          children: [

            const Text("Choose who to welcome for your first reservation", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),

            const Text("After your first guest, anyone can book your place.",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGuestType = 'Any Putko guest';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: _selectedGuestType == 'Any Putko guest'
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
                            'Any Putko guest',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Get reservations faster when you \nwelcome anyone from the \nPutko community.',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      _selectedGuestType == 'Any Putko guest'
                          ? Icon(
                        Icons.radio_button_checked,
                        size: 40.0,
                        color: const Color(0xFF4FBE9F),
                      )
                          : Icon(
                        Icons.radio_button_off,
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
                    _selectedGuestType = 'An Experienced guest';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: _selectedGuestType == 'An Experienced guest'
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
                            'An Experienced guest',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'For your first guest, welcome \nsomeone with a good track record\non putko who can offer tips for how\nto be a great Host.',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      _selectedGuestType == 'An Experienced guest'
                          ? Icon(
                        Icons.radio_button_checked,
                        size: 40.0,
                        color: const Color(0xFF4FBE9F),
                      )
                          : Icon(
                        Icons.radio_button_off,
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
