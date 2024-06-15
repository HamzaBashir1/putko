import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:putko/screens/home_screen.dart';
// import 'package:models/models.dart';

import '../model/booking_steps.dart';
import '../shared/theme/colors.dart';
import '../widget/select_date_widget.dart';
import '../widget/select_destination_widget.dart';
import '../widget/select_guests_widget.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  var step = BookingSteps.selectDate;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
      child: Scaffold(
        backgroundColor: appWhite.withOpacity(0.5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            // onPressed: () => context.pop(),
            onPressed: () {
              Navigator.pushReplacement(
                  context, PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
              ),
              );
            },
            icon: const Icon(Icons.close),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Stays',
                  style: textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Experiences',
                  style: textTheme.titleMedium,
                ),
              ),
            ],
          ),
          actions: const [SizedBox(width: 48.0)],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      step = BookingSteps.selectDestination;
                    });
                  },
                  child: Hero(
                    tag: 'search',
                    child: SelectDestinationWidget(step: step),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      step = BookingSteps.selectDate;
                    });
                  },
                  child: SelectDateWidget(step: step),
                ),
                (step == BookingSteps.selectDate)
                    ? const SizedBox()
                    : GestureDetector(
                  onTap: () {
                    setState(() {
                      step = BookingSteps.selectGuest;
                    });
                  },
                  child: SelectGuestsWidget(step: step),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: (step == BookingSteps.selectDate)
            ? null
            : BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          notchMargin: 0,
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  if (step == BookingSteps.selectDestination) {
                    setState(() {
                      step = BookingSteps.selectGuest;
                    });
                  } else {
                    setState(() {
                      step = BookingSteps.selectDestination;
                    });
                  }
                },
                child: Text(
                  'Clear all',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              FilledButton.icon(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: appRed,
                  minimumSize: const Size(100, 56.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                icon: const Icon(Icons.search),
                label: const Text('Search'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}