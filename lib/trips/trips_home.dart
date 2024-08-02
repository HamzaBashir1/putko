import 'package:flutter/material.dart';
import 'package:putko/widget/guest_home_screen.dart';

import '../screens/home_screen.dart';

class TripsHome extends StatefulWidget {
  TripsHome({super.key});

  @override
  State<TripsHome> createState() => _TripsHomeState();
}

class _TripsHomeState extends State<TripsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              top: constraints.maxHeight * 0.1, // Adjust the top padding based on screen height
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Trips',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                  color: Colors.grey,
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'No trips booked...yet!',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Time to dust off your bags and start\nplanning your next adventure.',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Code to be executed when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (e) => HomeScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Start searching',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        "Can't find your reservation here? ",
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (e) => const LoginScreen(),
                        //   ),
                        // );
                      },
                      child: Text(
                        'Visit the Help Center',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}