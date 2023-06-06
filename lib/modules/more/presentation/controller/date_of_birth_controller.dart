import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DatePickerController extends GetxController{
  final Rx<TextEditingController> dobDateController = TextEditingController().obs;
  final box=GetStorage();
  Rx<DateTime> today = DateTime.now().obs;

  dateOfBirth(BuildContext context) async {
    final selected = await showDatePicker(
        context: context,
        initialDate: today.value,
        firstDate: DateTime(1965),
        lastDate: DateTime(2050));







    if (selected != null && selected != today) {
      dobDateController.value.text =
      "${selected.year}-${selected.month}-${selected.day}";
    }
  }

}