import 'package:flutter/material.dart';
import 'package:putko/widget/calendar_widget.dart';

class Availability extends StatefulWidget {
  const Availability({super.key});

  @override
  State<Availability> createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                Text(
                  '£109 night',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sep 8 - 13',
                  style: TextStyle(fontSize: 16, decoration: TextDecoration.underline),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const ConfirmAndPay()),
                // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4FBE9F),
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              child: const Text('Save', style: TextStyle(color: Colors.white, fontSize: 14),),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Select dates",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Add your travel dates for exact pricing.",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),




            ],
          ),
        ),
      ),
    );
  }
}

