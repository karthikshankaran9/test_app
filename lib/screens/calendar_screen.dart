import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String _bookingMessage = "Select a date to see booking details."; 

  final Set<DateTime> _iconDays = {
    DateTime(2025, 3, 4),
    DateTime(2025, 3, 5),
    DateTime(2025, 3, 6),
    DateTime(2025, 3, 17),
    DateTime(2025, 3, 20),
  };

  final Map<DateTime, String> _bookedBeerParties = {
    DateTime(2025, 3, 4): "Table 3",
     DateTime(2025, 3, 5): "Table 3 & 4",
    DateTime(2025, 3, 6):   "Table 2 & 5 ",
    DateTime(2025, 3, 17): "Table 4",
    DateTime(2025, 3, 20): "Table 4 & 5",
  };

  void _updateBookingMessage(DateTime selectedDay) {
    setState(() {
      if (_bookedBeerParties.containsKey(selectedDay)) {
        _bookingMessage = "You have booked ${_bookedBeerParties[selectedDay]} on ${selectedDay.day}-${selectedDay.month}-${selectedDay.year}.";
      } else {
        _bookingMessage = "No bookings on this date.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar(
                firstDay: DateTime(2020),
                lastDay: DateTime(2030),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                  _updateBookingMessage(selectedDay); 
                },
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  outsideDaysVisible: false,
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: Colors.red),
                ),
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    bool hasIcon = _iconDays.any((d) =>
                        d.year == day.year && d.month == day.month && d.day == day.day);

                    return Container(
                      margin:const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              '${day.day}',
                              style:const TextStyle(fontSize: 16),
                            ),
                          ),
                          if (hasIcon)
                           const Positioned(
                              top: 2,
                              right: 2,
                              child: Icon(
                                Icons.emoji_events, 
                                size: 14, 
                                color: Colors.black,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _bookingMessage,
                style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

