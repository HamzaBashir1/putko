import 'package:flutter/material.dart';
import 'package:putko/profile/components/support/visithelpcenter/component/experience_host.dart';
import 'package:putko/profile/components/support/visithelpcenter/component/guest.dart';
import 'package:putko/profile/components/support/visithelpcenter/component/host.dart';
import 'package:putko/profile/components/support/visithelpcenter/component/travel.dart';

class VisitTheHelpCenter extends StatefulWidget {
  const VisitTheHelpCenter({super.key});

  @override
  _VisitTheHelpCenterState createState() => _VisitTheHelpCenterState();
}

class _VisitTheHelpCenterState extends State<VisitTheHelpCenter> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Text("Hi Hamza,\nhow can we help?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  side: const BorderSide(width: 1, color: Colors.grey),
                ),
              ),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.pink,
                    size: 24.0,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    'Search help',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  tabs: const [
                    Tab(text: "Guest"),
                    Tab(text: "Host",),
                    Tab(text: "Experience Host",),
                    Tab(text: "Travel",)
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      Guest(),
                      Host(),
                      ExperienceHost(),
                      Travel(),
                    ],
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
