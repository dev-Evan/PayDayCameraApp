import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payrun_badge_view.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
class PayRunBadge extends StatelessWidget {
  const PayRunBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Column(

        children: [
          customMoreAppbar(titleText:AppString.text_payrun_badge, ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: const [
                PayRunBadgeView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
