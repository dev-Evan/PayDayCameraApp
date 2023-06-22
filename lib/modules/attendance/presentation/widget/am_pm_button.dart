import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/controller/date_time_helper_controller.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';

import '../../../../utils/app_color.dart';

class AmPmToggleButton extends StatefulWidget {

  const AmPmToggleButton({Key? key}) : super(key: key);

  @override
  State<AmPmToggleButton> createState() => _AmPmToggleButtonState();
}

class _AmPmToggleButtonState extends State<AmPmToggleButton> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _customRadioButton("AM", 1),
          SizedBox(width: AppLayout.getWidth(20)),
          _customRadioButton("PM", 2),
        ],
      ),
    );
  }

  Widget _customRadioButton(String text, int index) {
    return OutlinedButton(
      style: value == index
          ? OutlinedButton.styleFrom(
              backgroundColor: AppColor.primaryBlue.withOpacity(.15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              side: const BorderSide(width: .5, color: AppColor.primaryBlue),
            )
          : OutlinedButton.styleFrom(
              backgroundColor: Colors.grey.withOpacity(.15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
      onPressed: () {
        setState(() {
          value = index;
          value == 1
              ? Get.find<DateTimeController>().clockHrsFormat = "AM"
              : Get.find<DateTimeController>().clockHrsFormat = "PM";
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: value == index ? AppColor.primaryBlue : Colors.black,
        ),
      ),
    );
  }
}
