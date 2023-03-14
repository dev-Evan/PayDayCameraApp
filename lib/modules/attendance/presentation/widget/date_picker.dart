import 'package:flutter/material.dart';

class datePickarScreen extends StatefulWidget {
  const datePickarScreen({Key? key}) : super(key: key);

  @override
  State<datePickarScreen> createState() => _datePickarScreenState();
}

class _datePickarScreenState extends State<datePickarScreen> {

  DateTimeRange? _selectedDateRange;

  // This function will be triggered when the floating button is pressed
  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',

    );

    if (result != null) {
      print(result.start.toString());
      setState(() {
        _selectedDateRange = result;
      });
    }
  }
  @override
  void initState() {
    _show();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: _selectedDateRange == null
          ? const Center(
        child: Text('Press the button to show the picker'),
      )
          : Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Start date
            Text(
              "Start date: ${_selectedDateRange?.start.toString().split(' ')[0]}",
              style: const TextStyle(fontSize: 24, color: Colors.blue),
            ),
            const SizedBox(
              height: 20,
            ),
            // End date
            Text(
                "End date: ${_selectedDateRange?.end.toString().split(' ')[0]}",
                style: const TextStyle(fontSize: 24, color: Colors.red))
          ],
        ),
      ),
        // This button is used to show the date range picker

    );
  }
}