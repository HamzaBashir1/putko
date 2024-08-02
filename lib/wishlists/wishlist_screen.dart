import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:putko/widget/guest_home_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const AppNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        flexibleSpace: Stack(
          children: [
            Positioned(
              top: 60.0,
              right: 8.0,
              child: ElevatedButton(
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: Text(
              'Wishlists',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Bootstrap.clock_history,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Recently Viewed",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
