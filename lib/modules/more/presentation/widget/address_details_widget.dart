import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../../../../common/widget/custom_spacer.dart';

Widget test({required titleText, required subTitleText}) {
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

Widget textTitle({required titleText}) {
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

Widget detailsTextLayout(
    {required leftTitleText,
      required leftSubtext,
      required rightTitleText,
      required rightSubtext}) {
  return Container(
    margin: EdgeInsets.only(top: AppLayout.getHeight(12)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textTitle(titleText: leftTitleText),
                customSpacerHeight(height: 3),
                textSubTitle(subTitleText: leftSubtext)
              ],
            )),
        customSpacerWidth(width: 20),

        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textTitle(titleText: rightTitleText),
                customSpacerHeight(height: 3),
                textSubTitle(subTitleText: rightSubtext)
              ],
            )),
      ],
    )
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

            Get.find<InputTextFieldController>().areaController.text =
            type == "permanent_address"
                ? Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress
                ?.area !=null?

            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress
                ?.area
                .toString() ??
                "":AppString.text_not_added_yet


                :Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress
                ?.area !=null?


            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress
                ?.area
                .toString() ??
                "":AppString.text_not_added_yet;

            Get.find<InputTextFieldController>().cityController.text =
            type == "permanent_address"
                ?
            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress
                ?.city !=null?



            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress

                ?.city
                .toString() ??
                "":AppString.text_not_added_yet
                :
            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress

                ?.city !=null?

            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress

                ?.city
                .toString() ??
                "":AppString.text_not_added_yet;

            Get.find<InputTextFieldController>().detailsController.text =
            type == "permanent_address"
                ?Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress

                ?.details !=null?


            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress

                ?.details
                .toString() ??
                "":AppString.text_not_added_yet
                : Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress

                ?.details !=null?



            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress

                ?.details
                .toString() ??
                "":AppString.text_not_added_yet;

            Get.find<InputTextFieldController>().phoneNumberController.text =
            type == "permanent_address"
                ?Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress

                ?.phoneNumber !=null?


            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress

                ?.phoneNumber
                .toString() ??
                "":AppString.text_not_added_yet
                : Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress

                ?.phoneNumber !=null?


            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress

                ?.phoneNumber
                .toString() ??
                "":AppString.text_not_added_yet;

            Get.find<InputTextFieldController>().stateController.text =
            type == "permanent_address"
                ?Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress

                ?.state !=null?


            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress

                ?.state
                .toString() ??
                "":AppString.text_not_added_yet
                :
            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress

                ?.state !=null?
            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress

                ?.state
                .toString() ??
                "":AppString.text_not_added_yet;

            Get.find<InputTextFieldController>().zipCodeController.text =
            type == "permanent_address"
                ?Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress

                ?.zipCode !=null?

            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress

                ?.zipCode
                .toString() ??
                "":AppString.text_not_added_yet
                :
            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress

                ?.zipCode !=null?
            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress

                ?.zipCode
                .toString() ??
                "":AppString.text_not_added_yet;


            Get.find<InputTextFieldController>().countyTextController.text =
            type == "permanent_address"
                ?
            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress

                ?.country !=null?

            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress

                ?.country
                .toString() ??
                "":AppString.text_not_added_yet
                : Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress

                ?.country !=null?

            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress

                ?.country
                .toString() ??
                "":AppString.text_not_added_yet;
            Get.find<InputTextFieldController>().phoneNumberController.text =
            type == "permanent_address"
                ?
            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress

                ?.phoneNumber !=null?
            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.permanentAddress

                ?.phoneNumber
                .toString() ??
                "":AppString.text_not_added_yet
                :
            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress

                ?.phoneNumber !=null?

            Get.find<AddressController>()
                .addressDetailsModel
                .data
                ?.presentAddress

                ?.phoneNumber
                .toString() ??
                "":AppString.text_not_added_yet;
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

Widget countyField({context, onAction, String? Function(String?)? validator,required TextEditingController controller}) {
  return Center(
    child: TextFormField(
      validator: validator,


      controller:controller,
      readOnly: true,
      onTap: () => onAction(),

      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
            left: AppLayout.getWidth(16),
            right: AppLayout.getWidth(20),
            top: AppLayout.getHeight(16),
            bottom: AppLayout.getHeight(16)),
        hintText: AppString.text_select_county,
        focusColor: AppColor.primaryColor,
        hintStyle: GoogleFonts.poppins(
            color: AppColor.hintColor,
            fontSize: Dimensions.fontSizeDefault + 1),
        filled: false,
        suffixIcon: Icon(Icons.keyboard_arrow_down,color: controller.text.isNotEmpty?AppColor.normalTextColor:AppColor.hintColor,),

        fillColor: AppColor.backgroundColor,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(width: 0.0, color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.solidGray),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
        border: OutlineInputBorder(
          borderSide:
          const BorderSide(width: 0.0, color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
        ),
      ),
    ),
  );
}

Widget phoneAndCountyField({required TextEditingController controller,final String? Function(String?)? validator}) {
  return IntlPhoneField(
    disableLengthCheck: true,
      decoration: InputDecoration(
        labelText: AppString.text_not_added_yet,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.solidGray),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 0.0, color: AppColor.disableColor),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      ),
      controller:controller

  );
}

TextStyle get countyTextStyle {
  return const TextStyle(fontSize: 16, color: AppColor.normalTextColor);
}
InputDecoration get countryDecoration {
  return InputDecoration(
      hintText: AppString.text_search,
      isDense: true,
      focusedBorder:
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      border:
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)));
}

BorderRadius get countyFieldRadius {
  return BorderRadius.only(
    topLeft: Radius.circular(Dimensions.radiusMid),
    topRight: Radius.circular(Dimensions.radiusMid),
  );
}