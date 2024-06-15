import 'package:flutter/material.dart';
import 'package:putko/profile/components/credits_coupons.dart';
import 'package:putko/profile/components/donations.dart';
import 'package:putko/profile/components/payment_methods.dart';
import 'package:putko/profile/components/payout_methods.dart';
import 'package:putko/profile/components/your_payment.dart';

class PaymentPayouts extends StatefulWidget {
  const PaymentPayouts({super.key});

  @override
  State<PaymentPayouts> createState() => _PaymentPayoutsState();
}

class _PaymentPayoutsState extends State<PaymentPayouts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Stack(
          children: [
            Positioned(
              top: 40,
              right: 8.0,
              child: const Text(
                '€-Euro',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [

            Row(
              children: [
                Text("Payments & payouts",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 25,bottom: 14),
              child: Row(
                children: [
                  Text(
                    "Travelling",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentMethods()),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                    child: Container(
                      width:25,
                      height: 25,
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        child: Icon(Icons.payments),
                      ),
                    ),
                  ),
                  const Wrap(
                    direction: Axis.horizontal,
                    spacing: 95, // <-- Spacing between children
                    children: <Widget>[
                      Text("Payments methods",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      // Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ],
              ),
            ),



            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const YourPayment()),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                    child: Container(
                      width:25,
                      height: 25,
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        child: Icon(Icons.format_list_bulleted),
                      ),
                    ),
                  ),
                  const Wrap(
                    direction: Axis.horizontal,
                    spacing: 95, // <-- Spacing between children
                    children: <Widget>[
                      Text("Your payments",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      // Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ],
              ),
            ),



            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreditsCoupons()),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                    child: Container(
                      width:25,
                      height: 25,
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        child: Icon(Icons.credit_card),
                      ),
                    ),
                  ),
                  const Wrap(
                    direction: Axis.horizontal,
                    spacing: 95, // <-- Spacing between children
                    children: <Widget>[
                      Text("Credits & coupons",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      // Icon(Icons.keyboard_arrow_right),
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
              padding: const EdgeInsets.only(top: 25,bottom: 12),
              child: Row(
                children: [
                  Text(
                    "Hosting",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PayoutMethods()),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                    child: Container(
                      width:25,
                      height: 25,
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        child: Icon(Icons.payments),
                      ),
                    ),
                  ),
                  const Wrap(
                    direction: Axis.horizontal,
                    spacing: 95, // <-- Spacing between children
                    children: <Widget>[
                      Text("Payout methods",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      // Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const PaymentPayouts()),
                // );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                    child: Container(
                      width:25,
                      height: 25,
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        child: Icon(Icons.file_copy_outlined),
                      ),
                    ),
                  ),
                  const Wrap(
                    direction: Axis.horizontal,
                    spacing: 95, // <-- Spacing between children
                    children: <Widget>[
                      Text("Transaction history",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      // Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Donations()),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                    child: Container(
                      width:25,
                      height: 25,
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        child: Icon(Icons.real_estate_agent_sharp),
                      ),
                    ),
                  ),
                  const Wrap(
                    direction: Axis.horizontal,
                    spacing: 95, // <-- Spacing between children
                    children: <Widget>[
                      Text("Donations",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      // Icon(Icons.keyboard_arrow_right),
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
