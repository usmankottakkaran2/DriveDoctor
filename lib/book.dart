import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class book extends StatefulWidget {
  @override
  _bookState createState() => _bookState();
}

class _bookState extends State<book> {
  
  List<DateTime> _timeSlots = List.generate(
      10, (index) => DateTime(0, 0, 0, index + 9, 0, 0)); // 10 time slots from 9:00 AM to 9:00 PM

  DateTime? _selectedDate;
  DateTime? _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedTime = _timeSlots[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime(2021, 1, 1),
              lastDay: DateTime(2021, 12, 31),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Selected Date: ${_selectedDate.toString()}',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              itemCount: _timeSlots.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) {
                final timeSlot = _timeSlots[index];
                final isSelected = timeSlot == _selectedTime;
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedTime = timeSlot;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isSelected ? Colors.blue : Colors.grey[200],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${timeSlot.hour.toString().padLeft(2, '0')}:00',
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: isSelected ? FontWeight.bold : null,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              'Selected Time Slot: ${_selectedTime?.hour.toString().padLeft(2, '0')}:00',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
