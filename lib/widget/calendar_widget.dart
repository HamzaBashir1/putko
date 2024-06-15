import 'package:flutter/material.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _selectedDate = DateTime.now();
  int _currentMonth = DateTime.now().month;
  int _currentYear = DateTime.now().year;

  void _onDaySelected(DateTime selectedDate) {
    setState(() {
      _selectedDate = selectedDate;
    });
  }

  List<DateTime> _getDaysInMonth(int month, int year) {
    final DateTime firstDay = DateTime(year, month);
    final DateTime lastDay = DateTime(year, month + 1, 0);
    return List.generate(lastDay.difference(firstDay).inDays + 1,
            (index) => firstDay.add(Duration(days: index)));
  }

  List<Widget> _generateCalendarDays(int month, int year) {
    final List<Widget> days = [];
    final List<DateTime> daysInMonth = _getDaysInMonth(month, year);
    final int firstDayIndex =
        daysInMonth[0].weekday - 1; // 0 for Monday, 6 for Sunday

    // Add empty days before the first day of the month
    for (int i = 0; i < firstDayIndex; i++) {
      days.add(Container());
    }

    for (DateTime date in daysInMonth) {
      days.add(
        GestureDetector(
          onTap: () => _onDaySelected(date),
          child: Container(
            decoration: BoxDecoration(
              border: date == _selectedDate
                  ? Border.all(color: Colors.blue, width: 2)
                  : null,
              borderRadius: BorderRadius.circular(5),
              color: date.weekday == 7 || date.weekday == 6
                  ? Colors.grey[200]
                  : Colors.white,
            ),
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                '${date.day}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: date == _selectedDate
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _currentMonth--;
                      if (_currentMonth == 0) {
                        _currentMonth = 12;
                        _currentYear--;
                      }
                    });
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Text(
                  '${_currentMonth}/${_currentYear}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _currentMonth++;
                      if (_currentMonth == 13) {
                        _currentMonth = 1;
                        _currentYear++;
                      }
                    });
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 7,
              children: [
                ..._generateCalendarDays(_currentMonth, _currentYear),
              ],
            ),
          ),
          // Display selected date
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Selected Date: ${_selectedDate.toString()}',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}