import 'package:flutter/material.dart';
import 'package:putko/screens/home_screen.dart';
import 'package:putko/today_screen/today_screen.dart';
import 'package:putko/widget/host_navbar.dart';

class StickyButton extends StatefulWidget {
  const StickyButton({Key? key}) : super(key: key);

  @override
  State<StickyButton> createState() => _StickyButtonState();
}

class _StickyButtonState extends State<StickyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>const TodayScreen()),
          );
        },
        child: const Text(
          'Switch to hosting',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}