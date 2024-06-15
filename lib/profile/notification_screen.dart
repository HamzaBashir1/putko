import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [

            Row(
              children: [
                Text(
                  "Notification",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 200,
            ),

            Column(
              children: [
                Center(
                  child: Icon(Icons.notifications),
                ),

                SizedBox(
                  height: 20,
                ),

                Center(
                  child: Text(
                    "No Notifications yet",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                SizedBox(
                  height: 5,
                ),

                Center(
                  child: Text(
                    "You've got a blank slate(for now). We'll let",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),

                Center(
                  child: Text(
                    "you know when updates arrive!",
                    style: TextStyle(
                      fontSize: 15,
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
