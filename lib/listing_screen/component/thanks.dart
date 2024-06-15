import 'package:flutter/material.dart';
import 'package:putko/widget/common_button.dart';
import 'package:putko/widget/host_navbar.dart';

import '../listings.dart';

class Thanks extends StatefulWidget {
  const Thanks({super.key});

  @override
  State<Thanks> createState() => _ThanksState();
}

class _ThanksState extends State<Thanks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: HostNavbar(),
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 10),
        child: Column(
          children: [

            SizedBox(
              height: 20,
            ),

            Spacer(),

            Text("Congratulations, Hamza!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),

            Text("From one Host to another - welcome abroad. Thanks you for sharing your home and helping to create increadible experiences for ou guest.",
            style: TextStyle(
              fontSize: 16
            ),
            ),

            SizedBox(
              height: 20,
            ),

            CommonButton(
              buttonText: "Let's get started",
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Listings()),
                );
              },
            ),

            Spacer(),

          ],
        ),
      ),
    );
  }
}
