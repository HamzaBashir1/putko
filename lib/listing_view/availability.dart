import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Availability extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;
  const Availability({super.key, required this.documentSnapshot});

  @override
  State<Availability> createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  List<DateTime> _selectedDays = [];
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _retrieveSelectedDaysLocally();
  }

  Future<void> _storeSelectedDaysLocally() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedDaysJson = _selectedDays.map((day) => day.toIso8601String()).toList();
    await prefs.setStringList('selected_days', selectedDaysJson);
  }

  Future<void> _retrieveSelectedDaysLocally() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedDaysJson = prefs.getStringList('selected_days');
    if (selectedDaysJson!= null) {
      setState(() {
        _selectedDays = selectedDaysJson.map((json) => DateTime.parse(json)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.documentSnapshot == null) {
      return Center(child: Text('No document snapshot available'));
    }

    final snap = widget.documentSnapshot;
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
            Column(
              children: [
                Text(
                  '€${snap['price']} night',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _selectedDays.length > 1
                      ? '${DateFormat('d MMM').format(_selectedDays.first)} - ${DateFormat('d MMM').format(_selectedDays.last)} (${_selectedDays.length} nights)'
                      : _selectedDays.isEmpty
                      ? 'No dates selected'
                      : '${DateFormat('d MMM').format(_selectedDays.first)} (${_selectedDays.length} night)',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Book the room for the selected days
                //...
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
              child: const Text('Book'),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
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
              Calendar(
                onDaySelected: (day) {
                  setState(() {
                    if (_selectedDays.contains(day)) {
                      _selectedDays.remove(day);
                    } else {
                      _selectedDays.add(day);
                    }
                    _storeSelectedDaysLocally(); // Store the selected days locally
                  });
                },
                focusedDay: _focusedDay,
                onFocusedDayChanged: (focusedDay) {
                  setState(() {
                    _focusedDay = focusedDay;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  final DateTime focusedDay;
  final ValueChanged<DateTime> onDaySelected;
  final ValueChanged<DateTime> onFocusedDayChanged;

  const Calendar({
    required this.focusedDay,
    required this.onDaySelected,
    required this.onFocusedDayChanged,
  });

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<DateTime> _days = [];
  List<DateTime> _selectedDays = [];

  @override
  void initState() {
    super.initState();
    _generateDays();
  }

  void _generateDays() {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    _days = [];
    for (int i = 0; i < 42; i++) {
      final day = firstDayOfMonth.add(Duration(days: i));
      if (day.month == now.month) {
        _days.add(day);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        itemCount: _days.length,
        itemBuilder: (context, index) {
          final day = _days[index];
          bool isSelected = _selectedDays.contains(day);

          return GestureDetector(
            onTap: () {
              if (isSelected) {
                _selectedDays.remove(day);
              } else {
                _selectedDays.add(day);
              }
              widget.onDaySelected(day);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected
                      ? Colors.deepOrange
                      : day == widget.focusedDay
                      ? Colors.deepOrange
                      : Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4),
                color: isSelected? Colors.deepOrange : null,
              ),
              child: Center(
                child: Text(
                  day.day.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected || day == widget.focusedDay
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}