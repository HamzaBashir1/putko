import 'package:flutter/material.dart';
import 'package:putko/widget/common_button.dart';

class TravelForWork extends StatefulWidget {
  const TravelForWork({super.key});

  @override
  State<TravelForWork> createState() => _TravelForWorkState();
}

class _TravelForWorkState extends State<TravelForWork> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Travel for work"),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "Try Putko for Work",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Text("Add your work email to unlock extra perks for business trips"),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    'Work email',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'info@putko.co.uk',
                ),
              ),
              const Spacer(),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CommonButton(
                  buttonText: "Add Work Email",
                  onTap: () {
      
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}