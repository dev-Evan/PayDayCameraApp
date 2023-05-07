import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payrun_badge_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payrun_badge_view.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class PayRunBadge extends GetView<PayrunBadgeController> {
  PayRunBadge({Key? key}) : super(key: key);
   PayrunBadgeController payrunBadgeController=Get.put(PayrunBadgeController());



  @override
  Widget build(BuildContext context) {
    payrunBadgeController.getPayrunBadgeData();

    return controller.obx(
            (state) => Scaffold(
          appBar: const CustomAppbar(),
          body: Column(
            children: [
              customMoreAppbar(titleText:AppString.text_payrun_badge, ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:  [
                    PayRunBadgeView(),
                  ],
                ),
              ),
            ],
          ) ,
        ),
        onLoading: const LoadingIndicator());
  }
}