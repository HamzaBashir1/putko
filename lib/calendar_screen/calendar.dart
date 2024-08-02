import 'package:flutter/material.dart';
import 'package:putko/widget/calendar_widget.dart';
import 'package:putko/widget/host_home_screen.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: HostNavbar(),

      body: CalendarWidget(),
    );
  }
}


