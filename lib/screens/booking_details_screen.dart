import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:putko/screens/home_screen.dart';

import '../model/booking_steps.dart';
import '../shared/theme/colors.dart';
import '../widget/select_date_widget.dart';
import '../widget/select_destination_widget.dart';
import '../widget/select_guests_widget.dart';

// Mock function to simulate fetching filtered properties
Future<List<String>> fetchFilteredProperties(String destination, DateTimeRange dateRange, int guestCount) async {
  // Replace this with your actual data fetching logic
  await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
  return ['Property 1', 'Property 2', 'Property 3'];
}

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  var step = BookingSteps.selectDate;
  String? selectedDestination;
  DateTimeRange? selectedDateRange;
  int? selectedGuestCount;

  void _searchProperties() async {
    if (selectedDestination != null && selectedDateRange != null && selectedGuestCount != null) {
      List<String> results = await fetchFilteredProperties(
        selectedDestination!,
        selectedDateRange!,
        selectedGuestCount!,
      );
      // Navigate to results page or update state to show results
      print('Filtered Properties: $results');
    } else {
      // Show an error message or prompt user to complete all steps
      print('Please complete all steps to search.');
    }
  }

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
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
                    child: SelectDestinationWidget(
                      step: step,
                      onDestinationSelected: (destination) {
                        setState(() {
                          selectedDestination = destination;
                        });
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      step = BookingSteps.selectDate;
                    });
                  },
                  child: SelectDateWidget(
                    step: step,
                    onDateRangeSelected: (dateRange) {
                      setState(() {
                        selectedDateRange = dateRange;
                      });
                    },
                  ),
                ),
                (step == BookingSteps.selectDate)
                    ? const SizedBox()
                    : GestureDetector(
                  onTap: () {
                    setState(() {
                      step = BookingSteps.selectGuest;
                    });
                  },
                  child: SelectGuestsWidget(
                    step: step,
                    onGuestCountSelected: (guestCount) {
                      setState(() {
                        selectedGuestCount = guestCount;
                      });
                    },
                  ),
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
                  setState(() {
                    selectedDestination = null;
                    selectedDateRange = null;
                    selectedGuestCount = null;
                    step = BookingSteps.selectDate;
                  });
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
                onPressed: _searchProperties,
                style: FilledButton.styleFrom(
                  backgroundColor: appGreen,
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
