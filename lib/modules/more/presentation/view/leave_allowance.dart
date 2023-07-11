import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../../common/widget/no_data_found.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import '../controller/announcement_controller.dart';

class LeaveAllowanceScreen extends GetView<AnnouncementController> {
  const LeaveAllowanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: controller.obx((state) => SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: (controller.leaveAllowanceDetailsModel.data !=null && controller.leaveAllowanceDetailsModel.data!.isNotEmpty)?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _subAppbar(),
            Container(margin: edgeInsets, child: _titleText(text: AppString.text_paid)),

            ListView.builder(
                itemCount: controller.paidLeave.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _cardBox(context: context,
                  type: controller.paidLeave[index].type ??"",
                  earned: controller.paidLeave[index].earned ??"",
                  allowance: controller.paidLeave[index].allowance ??"",
                  taken: controller.paidLeave[index].taken ??"",
                  availability: controller.paidLeave[index].availability ??"",


                  );
                }),
            Container(
                margin: edgeInsets, child: _titleText(text: AppString.text_unpaid)),
            ListView.builder(
                itemCount: controller.unpaidLeave.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _cardBox(context: context,
                    type: controller.unpaidLeave[index].type ??"",
                    earned: controller.unpaidLeave[index].earned ??"",
                    allowance: controller.unpaidLeave[index].allowance ??"",
                    taken: controller.unpaidLeave[index].taken ??"",
                    availability: controller.unpaidLeave[index].availability ??"",


                  );                }),
          ],
        ):noDataFound,
      ),onLoading: const LoadingIndicator()),
    );
  }
}

Widget _cardBox({required context,required type,required allowance,required earned,required taken,required availability}) {
  return Container(
    margin: cardEdgeInsets,
    width: MediaQuery.of(context).size.width,
    decoration: boxDecoration,
    child: Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _subTitleText(text: type),
          _subInnerText(allowance: allowance,earned: earned,taken: taken,availability: availability)
        ],
      ),
    ),
  );
}

Widget _subTitleText({required text}) {
  return Container(
    margin: EdgeInsets.only(bottom: AppLayout.getHeight(8)),
    child: Text(
      text,
      style: subTitleTextStyle,
    ),
  );
}

Widget _subInnerText({required allowance,required earned,required taken,required availability }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _subInnerRow(leftText: AppString.text_allowance,dynamicText: "$allowance"),
      _subInnerRow(leftText: AppString.text_earned,dynamicText: "$earned"),
      _subInnerRow(leftText: AppString.text_taken,dynamicText: "$taken"),
      _subInnerRow(leftText: AppString.text_availability,dynamicText: "$availability"),

    ],
  );
}

Widget _subInnerRow({required leftText, required dynamicText}) {
  return Container(
    margin: EdgeInsets.only(bottom: AppLayout.getHeight(4)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: subInnerTextStyle,
        ),
        Text(
          dynamicText,
          style: subInnerDynamicTextStyle,
        ),
      ],
    ),
  );
}

Decoration get boxDecoration {
  return BoxDecoration(
      color: AppColor.primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(Dimensions.radiusDefault.toDouble()));
}

Widget _subAppbar() {
  return customMoreAppbar(titleText: AppString.text_leave_allowance);
}

EdgeInsets get edgeInsets {
  return EdgeInsets.only(
      left: AppLayout.getWidth(20),
      right: AppLayout.getWidth(20),
      top: AppLayout.getHeight(0),
      bottom: AppLayout.getHeight(0));
}

EdgeInsets get cardEdgeInsets {
  return EdgeInsets.only(
      left: AppLayout.getWidth(20),
      right: AppLayout.getWidth(20),
      top: AppLayout.getHeight(0),
      bottom: AppLayout.getHeight(12));
}

Widget _titleText({required text}) {
  return Container(
    margin: EdgeInsets.only(bottom: AppLayout.getHeight(12)),
    child: Text(
      text,
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.normalTextColor,
          fontWeight: FontWeight.w500,
          fontSize: Dimensions.fontSizeDefault + 3),
    ),
  );
}

TextStyle get subTitleTextStyle {
  return AppStyle.mid_large_text.copyWith(
      color: AppColor.normalTextColor,
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.fontSizeDefault );
}

TextStyle get subInnerTextStyle {
  return AppStyle.mid_large_text.copyWith(
      color: AppColor.normalTextColor.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.fontSizeDefault );
}

TextStyle get subInnerDynamicTextStyle {
  return AppStyle.mid_large_text.copyWith(
      color: AppColor.normalTextColor,
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.fontSizeDefault );
}
