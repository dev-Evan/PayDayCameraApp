
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/custom_text_field_dob.dart';
class ApplyLeaveDobSingleDay extends StatelessWidget {
  const ApplyLeaveDobSingleDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldDob(
            hintText: '01-Jan-1996',
            dobIcon: Icons.calendar_month,
            dobIconAction: () {}),
      ],
    );
  }
}
