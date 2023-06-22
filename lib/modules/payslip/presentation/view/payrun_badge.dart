import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payrun_badge_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payrun_badge_view.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class PayRunBadge extends GetView<PayrunBadgeController> {
  const PayRunBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: controller.obx(
          (state) => SingleChildScrollView(
                child: Column(
                  children: [
                    _subAppbarTitleText(),
                    _payrunBadView(),
                  ],
                ),
              ),
          onLoading: const LoadingIndicator()),
    );
  }
}

Widget _subAppbarTitleText() {
  return customMoreAppbar(
    titleText: AppString.text_payrun_badge,
  );
}

Widget _payrunBadView() {
  return Padding(
    padding: EdgeInsets.only(
        left: AppLayout.getWidth(20),
        right: AppLayout.getWidth(20),
        top: AppLayout.getHeight(20),
        bottom: AppLayout.getHeight(20)),
    child: const Column(
      children: [
        PayRunBadgeView(),
      ],
    ),
  );
}
