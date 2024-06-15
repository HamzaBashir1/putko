import 'package:flutter/material.dart';

class AllReservation extends StatefulWidget {
  AllReservation({Key? key}) : super(key: key);

  @override
  State<AllReservation> createState() => _AllReservationState();
}

class _AllReservationState extends State<AllReservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            const Text(
              "Reservations",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            const SizedBox(height: 20),
            _TabBar(),
            const SizedBox(height: 20),
            _TabBarView(),
          ],
        ),
      ),
    );
  }
}

class _TabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [
        Tab(text: 'Checking out (0)'),
        Tab(text: 'Currently hosting (0)'),
        Tab(text: 'Upcoming'),
        Tab(text: 'Ongoing'),
        Tab(text: 'Past'),
      ],
    );
  }
}

class _TabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: TabBarView(
        children: [
          AllReservationsTab(),
          PendingReservationsTab(),
          UpcomingReservationsTab(),
          OngoingReservationsTab(),
          PendingReviewTab(),
        ],
      ),
    );
  }
}

class AllReservationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle_outline, size: 64),
          SizedBox(height: 16),
          Text(
            'You don\'t currently have reservations',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class PendingReservationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Pending Reservations'),
    );
  }
}

class UpcomingReservationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Upcoming Reservations'),
    );
  }
}

class OngoingReservationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Ongoing Reservations'),
    );
  }
}

class PendingReviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Past Reservations'),
    );
  }
}