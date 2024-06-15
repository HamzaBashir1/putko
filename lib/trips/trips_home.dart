import 'package:flutter/material.dart';
import 'package:putko/widget/app_nav_bar.dart';

import '../screens/home_screen.dart';

class TripsHome extends StatefulWidget {
  const TripsHome({super.key});

  @override
  State<TripsHome> createState() => _TripsHomeState();
}

class _TripsHomeState extends State<TripsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const AppNavBar(),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      // ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30,top: 100.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                    'Trips',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),

              ],
            ),
            const Divider(
              height: 20,
              thickness: 2,
              color: Colors.grey,
            ),
            const SizedBox(height: 15,),
            const Row(
              children: [
                Text(
                  'No trips booked...yet!',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500
                  ),
                ),

              ],
            ),

            const SizedBox(height: 5,),
            const Row(
              children: [
               Text(
                  'Time to dust off your bags and start\nplanning your next adventure.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ],
            ),

           const SizedBox(
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
                  child: const Text(
                      'Start searching',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),

                ),
              ],
            ),

            const SizedBox(
              height: 40,
            ),

            const Divider(
              height: 20,
              thickness: 2,
              color: Colors.grey,
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Can't find your reservation here? ",
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),

              ],

            ),

            const SizedBox(
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
                  child: const Text(
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
      ),

    );
  }
}
