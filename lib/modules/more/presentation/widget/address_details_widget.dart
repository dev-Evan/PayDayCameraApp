import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

import '../../../../common/widget/custom_spacer.dart';



Widget test({required titleText,required subTitleText}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        children: [

          textTitle(titleText: titleText),
        ],
      ),
      textSubTitle(subTitleText: subTitleText)
    ],
  );
}

Widget textTitle({ required titleText}) {
  return Text(
    titleText,
    style: AppStyle.mid_large_text.copyWith(
        color: AppColor.hintColor.withOpacity(0.9),
        fontSize: Dimensions.fontSizeDefault - 1,
        fontWeight: FontWeight.w200),
  );
}

Widget textSubTitle({required subTitleText}) {
  return Text(
    subTitleText,
    style: AppStyle.mid_large_text.copyWith(
        color: AppColor.normalTextColor,
        fontSize: Dimensions.fontSizeDefault + 1,
        fontWeight: FontWeight.w500),
  );
}










Widget addButton({onAction}) {
  return Row(
    children: [
      TextButton(
          onPressed: () => onAction(),
          child: Text(
            AppString.text_add,
            style: AppStyle.mid_large_text.copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeDefault),
          )),
      Icon(
        Icons.add,
        color: AppColor.primaryColor,
        size: Dimensions.fontSizeDefault + 8,
      )
    ],
  );
}

Widget editDetBtn(
    {required context, onAction, required editAction, required type}) {
  return Row(
    children: [
      InkWell(
          onTap: () {
            customButtonSheet(context: context, height: 0.9, child: editAction);

            Get.find<CustomTextEditingController>().areaController.text =
                type == "permanent_address"
                    ? Get.find<AddressDetailsController>()
                            .addressDetailsModel
                            .data
                            ?.first
                            .value
                            ?.area
                            .toString() ??
                        ""
                    : Get.find<AddressDetailsController>()
                            .addressDetailsModel
                            .data
                            ?.last
                            .value
                            ?.area
                            .toString() ??
                        "";

            Get.find<CustomTextEditingController>().cityController.text =
                type == "permanent_address"
                    ? Get.find<AddressDetailsController>()
                            .addressDetailsModel
                            .data
                            ?.first
                            .value
                            ?.city
                            .toString() ??
                        ""
                    : Get.find<AddressDetailsController>()
                            .addressDetailsModel
                            .data
                            ?.last
                            .value
                            ?.city
                            .toString() ??
                        "";

            Get.find<CustomTextEditingController>().detailsController.text =
                type == "permanent_address"
                    ? Get.find<AddressDetailsController>()
                            .addressDetailsModel
                            .data
                            ?.first
                            .value
                            ?.details
                            .toString() ??
                        ""
                    : Get.find<AddressDetailsController>()
                            .addressDetailsModel
                            .data
                            ?.last
                            .value
                            ?.details
                            .toString() ??
                        "";

            Get.find<CustomTextEditingController>().phoneNumberController.text =
                type == "permanent_address"
                    ? Get.find<AddressDetailsController>()
                            .addressDetailsModel
                            .data
                            ?.first
                            .value
                            ?.phoneNumber
                            .toString() ??
                        ""
                    : Get.find<AddressDetailsController>()
                            .addressDetailsModel
                            .data
                            ?.last
                            .value
                            ?.phoneNumber
                            .toString() ??
                        "";

            Get.find<CustomTextEditingController>().stateController.text =
                type == "permanent_address"
                    ? Get.find<AddressDetailsController>()
                            .addressDetailsModel
                            .data
                            ?.first
                            .value
                            ?.state
                            .toString() ??
                        ""
                    : Get.find<AddressDetailsController>()
                            .addressDetailsModel
                            .data
                            ?.last
                            .value
                            ?.state
                            .toString() ??
                        "";

            Get.find<CustomTextEditingController>().zipCodeController.text =
                type == "permanent_address"
                    ? Get.find<AddressDetailsController>()
                            .addressDetailsModel
                            .data
                            ?.first
                            .value
                            ?.zipCode
                            .toString() ??
                        ""
                    : Get.find<AddressDetailsController>()
                            .addressDetailsModel
                            .data
                            ?.last
                            .value
                            ?.zipCode
                            .toString() ??
                        "";
          },
          child: editIcon()),
      customSpacerWidth(width: 28),
      InkWell(
        onTap: () => onAction(),
        child: const Icon(
          CupertinoIcons.delete,
          color: AppColor.hintColor,
          size: 20,
        ),
      ),
    ],
  );
}

Widget editIcon() {
  return SizedBox(
      height: AppLayout.getHeight(20),
      width: AppLayout.getWidth(20),
      child: Image(image: AssetImage(Images.edit)));
}

Widget perTitleText() {
  return Text(
    "${AppString.text_permanent}${AppString.text_address}",
    style: AppStyle.mid_large_text
        .copyWith(color: AppColor.normalTextColor, fontWeight: FontWeight.bold),
  );
}

Widget currTitleText() {
  return Text(
    AppString.text_current_address,
    style: AppStyle.mid_large_text
        .copyWith(color: AppColor.normalTextColor, fontWeight: FontWeight.bold),
  );
}
