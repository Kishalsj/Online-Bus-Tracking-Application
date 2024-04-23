import 'package:flutter/material.dart';

class SelectedDateTimeDisplay extends StatefulWidget {
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  SelectedDateTimeDisplay({
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  _SelectedDateTimeDisplayState createState() => _SelectedDateTimeDisplayState();
}

class _SelectedDateTimeDisplayState extends State<SelectedDateTimeDisplay> {
  int selectedHour = 0;
  int selectedMinute = 0;

  @override
  void initState() {
    super.initState();
    selectedHour = widget.selectedTime.hour;
    selectedMinute = widget.selectedTime.minute;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Selected Daterrrrrrr: ${widget.selectedDate.year}-${widget.selectedDate.month}-${widget.selectedDate.day}',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Time: ',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<int>(
              value: selectedHour,
              onChanged: (int? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedHour = newValue;
                  });
                }
              },
              items: List.generate(24, (index) => index)
                  .map((hour) => DropdownMenuItem<int>(
                        value: hour,
                        child: Text('$hour'),
                      ))
                  .toList(),
            ),
            Text(
              ' : ',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<int>(
              value: selectedMinute,
              onChanged: (int? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedMinute = newValue;
                  });
                }
              },
              items: List.generate(60, (index) => index)
                  .map((minute) => DropdownMenuItem<int>(
                        value: minute,
                        child: Text('$minute'),
                      ))
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }
}
