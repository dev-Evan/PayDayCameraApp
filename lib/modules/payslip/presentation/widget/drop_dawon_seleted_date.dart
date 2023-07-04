import 'dart:convert';
import 'package:intl/intl.dart';

String lastMonth() {
  DateTime date = DateTime(
      DateTime.now().year, DateTime.now().month - 1, DateTime.now().day);
  return DateFormat('MMMM yyyy').format(date);
}

String thisMonth() {
  return DateFormat.MMMMd().format(DateTime.now());
}

String thisYear() {
  DateTime firstDate = DateTime(DateTime.now().year, 1, 1);
  DateTime lastDate = DateTime(DateTime.now().year, 12, 31);
  var fistDate1 = DateFormat('dd MMM yyyy').format(firstDate);
  var lastDate1 = DateFormat('dd MMM yyyy').format(lastDate);
  return '$fistDate1 - $lastDate1';
}

String lastYear() {
  var now = DateTime.now();
  var lastYear = DateTime(now.year - 1, 1, 1);
  var firstDate = DateTime(lastYear.year, 1, 1);
  var lastDate = DateTime(lastYear.year, 12, 31);

  var fistDate1 = DateFormat('dd MMM yyyy').format(firstDate);
  var lastDate1 = DateFormat('dd MMM yyyy').format(lastDate);
  return '$fistDate1 - $lastDate1';
}

String thisYarKey() {
  DateTime firstDate = DateTime(DateTime.now().year, 1, 1);
  DateTime lastDate = DateTime(DateTime.now().year, 12, 31);

  var fistDate1 = DateFormat('yyyy-MM-dd').format(firstDate);
  var lastDate1 = DateFormat('yyyy-MM-dd').format(lastDate);

  Map<String, String> queryParamsTY = {
    'start': fistDate1.toString(),
    'end': lastDate1.toString()
  };
  String value = json.encode(queryParamsTY);
  print(value.toString());
  return value.toString();
}

String thisMonthKey() {
  var now = DateTime.now();
  var firstDate = DateTime(now.year, now.month, 1);
  var lastDate = DateTime(now.year, now.month + 1, 0);

  var fistDate1 = DateFormat('yyyy-MM-dd').format(firstDate);
  var lastDate1 = DateFormat('yyyy-MM-dd').format(lastDate);

  Map<String, String> queryParamsTM = {
    'start': fistDate1.toString(),
    'end': lastDate1.toString()
  };
  String value = json.encode(queryParamsTM);
  print(value.toString());

  return value.toString();
}

String lastMonthKey() {
  var now = DateTime.now();
  var lastMonth = DateTime(now.year, now.month - 1, 1);
  var firstDate = DateTime(lastMonth.year, lastMonth.month, 1);
  var lastDate = DateTime(now.year, now.month, 0);

  var fistDate1 = DateFormat('yyyy-MM-dd').format(firstDate);
  var lastDate1 = DateFormat('yyyy-MM-dd').format(lastDate);

  Map<String, String> queryParamsLM = {
    'start': fistDate1.toString(),
    'end': lastDate1.toString()
  };
  String value = json.encode(queryParamsLM);
  print(value.toString());

  return value.toString();
}

String lastYearKey() {
  var now = DateTime.now();
  var lastYear = DateTime(now.year - 1, 1, 1);
  var firstDate = DateTime(lastYear.year, 1, 1);
  var lastDate = DateTime(lastYear.year, 12, 31);

  var fistDate1 = DateFormat('yyyy-MM-dd').format(firstDate);
  var lastDate1 = DateFormat('yyyy-MM-dd').format(lastDate);

  Map<String, String> queryParamsLY = {
    'start': fistDate1.toString(),
    'end': lastDate1.toString()
  };

  String value = json.encode(queryParamsLY);
  print(value.toString());
  return value.toString();
}
