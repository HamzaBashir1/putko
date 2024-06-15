import 'package:flutter/material.dart';

class YourPayment extends StatefulWidget {
  const YourPayment({super.key});

  @override
  State<YourPayment> createState() => _YourPaymentState();
}

class _YourPaymentState extends State<YourPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: const Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Your payments",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Once you have a reservation, this is where you can come to track your payments and refunds.",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(), // Add this to push the Divider and Text to the bottom
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: const Text(
              "To find another payments, try our Help Center",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(
            height: 40, // Add some space between the Text and the bottom of the screen
          ),
        ],
      ),
    );
  }
}