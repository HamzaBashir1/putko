import 'package:flutter/material.dart';
import 'package:putko/widget/host_home_screen.dart';

import '../widget/guest_home_screen.dart';

class HostMessage extends StatefulWidget {
  const HostMessage({super.key});

  @override
  State<HostMessage> createState() => _HostMessageState();
}

class _HostMessageState extends State<HostMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: HostNavbar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        flexibleSpace: Container(
          child: Stack(
            children: [

              Positioned(
                  top: 60.0,
                  right: 60.0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),

                  )
              ),
              Positioned(
                  top: 60.0,
                  right: 8.0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.tune),
                  )
              ),
            ],
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [

            Row(
              children: [
                Text(
                  'Messages',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 220,
            ),

            Column(
              children: [
                Center(
                  child: Icon(Icons.message),
                ),

                SizedBox(
                  height: 20,
                ),

                Center(
                  child: Text(
                    "You don't have any messages",
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
                    "when you recieve a new message, it will",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),

                Center(
                  child: Text(
                    "appear here.",
                    style: TextStyle(
                      fontSize: 12,
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
