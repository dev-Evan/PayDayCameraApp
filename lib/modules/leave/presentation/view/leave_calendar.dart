
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';

class DatePickerCustom extends StatefulWidget {
  const DatePickerCustom({Key? key}) : super(key: key);

  @override
  State<DatePickerCustom> createState() => _DatePickerCustomState();
}

class _DatePickerCustomState extends State<DatePickerCustom> {
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}
