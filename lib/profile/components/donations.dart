import 'package:flutter/material.dart';
import 'package:putko/profile/components/payment_payouts.dart';

class Donations extends StatefulWidget {
  const Donations({super.key});

  @override
  State<Donations> createState() => _DonationsState();
}

class _DonationsState extends State<Donations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
        child: Column(
          children: [

            const Text(
              "We're still working on donations",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            const Text(
              "We're working on making this feature available in more country. We'll let you know as soon as it's ready for you.",
              style: TextStyle(
                fontSize: 20
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), // Add this line
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const PaymentPayouts(),
                        ),
                      );
                    },
                    child: const Text("Got it"),
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
