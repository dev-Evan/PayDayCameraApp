import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/add_address.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/address_details_widget.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/edit_address.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../../../common/widget/custom_dialog_layout.dart';
import '../controller/address_controller.dart';

class AddressDetails extends GetView<AddressController> {
  const AddressDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: controller.obx(
          (state) => RefreshIndicator(
                onRefresh: _refreshPage,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      customMoreAppbar(
                          titleText: AppString.text_address_details),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //permanent address row layout here
                            _permanentAddressRowLayout(context),
                            //permanent address view layout here
                            _permanentAddressLayout(),
                            //present address row layout here
                            _presentAddressRowLayout(context),
                            //present address view layout here
                            _presentAddressLayout(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          onLoading: const LoadingIndicator()),
    );
  }

  Future<void> _refreshPage() async {
    controller.getEmployeeAddress();
  }

  _permanentAddressRowLayout(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        perTitleText(),
        controller.addressDetailsModel.data?.permanentAddress != null
            ? _editPermanentAddress(context)
            : addButton(onAction: () => _addPermanentAddress(context))
      ],
    );
  }

  _permanentAddressLayout() {
    return (controller.addressDetailsModel.data != null)
        ? controller.addressDetailsModel.data?.permanentAddress != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customSpacerHeight(height: 20),
                  _permanentDetailsText(),
                  customSpacerHeight(height: 8),
                  _permanentDetailsDynamicText(),
                  customSpacerHeight(height: 12),
                  _permanentAddressViewLayout()
                ],
              )
            : Container()
        : Container();
  }

  _presentAddressRowLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        currTitleText(),
        controller.addressDetailsModel.data?.presentAddress != null
            ? _editPresentAddress(context)
            : _addPresentAddress(context),
      ],
    );
  }

  _presentAddressLayout() {
    return controller.addressDetailsModel.data?.presentAddress != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customSpacerHeight(height: 20),
              _presentDetailsText(),
              customSpacerHeight(height: 8),
              _presentDetailsDynamicText(),
              customSpacerHeight(height: 12),
              _presentAddressViewLayout()
            ],
          )
        : Container();
  }

  _addPermanentAddress(context) {
    return customButtonSheet(
        context: context, height: 0.9, child: AddAddress("permanent_address"));
  }

  _editPermanentAddress(context) {
    return editDetBtn(
        context: context,
        onAction: () => _deletedAlert(
              context: context,
              addressType: "permanent_address",
            ),
        editAction: EditAddress(
            "permanent_address",
            controller
                    .addressDetailsModel.data?.permanentAddress?.countryCode ??
                ""),
        type: "permanent_address");
  }

  _editPresentAddress(context) {
    return editDetBtn(
        context: context,
        onAction: () => _deletedAlert(
              context: context,
              addressType: "present_address",
            ),
        editAction: EditAddress(
            "present_address",
            controller.addressDetailsModel.data?.presentAddress?.countryCode ??
                ""),
        type: "present_address");
  }

  _addPresentAddress(BuildContext context) {
    return addButton(onAction: () {
      customButtonSheet(
          context: context, height: 0.9, child: AddAddress("present_address"));
    });
  }

  _permanentDetailsText() {
    return Text(
      AppString.text_details,
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.hintColor.withOpacity(0.9),
          fontSize: Dimensions.fontSizeDefault + 2,
          fontWeight: FontWeight.w500),
    );
  }

  _permanentDetailsDynamicText() {
    return Text(
      controller.addressDetailsModel.data?.permanentAddress?.details
              .toString() ??
          "",
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.normalTextColor,
          fontSize: Dimensions.fontSizeDefault,
          fontWeight: FontWeight.w500),
    );
  }

  _permanentAddressViewLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _perAreaAndCityLayout(),
        _perStateAndZipLayout(),
        _perCountyAndPhoneLayout(),
        customSpacerHeight(height: 24),
      ],
    );
  }

  _perAreaAndCityLayout() {
    return detailsTextLayout(
      leftTitleText: AppString.text_area,
      rightTitleText: AppString.text_city,
      leftSubtext:
          controller.addressDetailsModel.data?.permanentAddress?.area != null
              ? controller.addressDetailsModel.data?.permanentAddress?.area
                      .toString() ??
                  ""
              : AppString.text_not_added_yet,
      rightSubtext:
          controller.addressDetailsModel.data?.permanentAddress?.city != null
              ? controller.addressDetailsModel.data?.permanentAddress?.city
                      .toString() ??
                  ""
              : AppString.text_not_added_yet,
    );
  }

  _perStateAndZipLayout() {
    return detailsTextLayout(
      leftTitleText: AppString.text_state,
      rightTitleText: AppString.text_zip_code,
      leftSubtext:
          controller.addressDetailsModel.data?.permanentAddress?.state != null
              ? controller.addressDetailsModel.data?.permanentAddress?.state
                      .toString() ??
                  ""
              : AppString.text_not_added_yet,
      rightSubtext:
          controller.addressDetailsModel.data?.permanentAddress?.zipCode != null
              ? controller.addressDetailsModel.data?.permanentAddress?.zipCode
                      .toString() ??
                  ""
              : AppString.text_not_added_yet,
    );
  }

  _perCountyAndPhoneLayout() {
    return detailsTextLayout(
      leftTitleText: AppString.text_county,
      rightTitleText: AppString.text_phone,
      leftSubtext:
          controller.addressDetailsModel.data?.permanentAddress?.country != null
              ? controller.addressDetailsModel.data?.permanentAddress?.country
                      .toString() ??
                  ""
              : AppString.text_not_added_yet,
      rightSubtext: controller
                  .addressDetailsModel.data?.permanentAddress?.phoneNumber !=
              null
          ? controller.addressDetailsModel.data?.permanentAddress?.phoneNumber
                  .toString() ??
              ""
          : AppString.text_not_added_yet,
    );
  }

  _presentDetailsText() {
    return Text(
      AppString.text_details,
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.hintColor.withOpacity(0.9),
          fontSize: Dimensions.fontSizeDefault + 2,
          fontWeight: FontWeight.w500),
    );
  }

  _presentDetailsDynamicText() {
    return Text(
      controller.addressDetailsModel.data?.presentAddress?.details != null
          ? controller.addressDetailsModel.data?.presentAddress?.details
                  .toString() ??
              ""
          : AppString.text_not_added_yet,
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.normalTextColor,
          fontSize: Dimensions.fontSizeDefault,
          fontWeight: FontWeight.w500),
    );
  }

  _presentAddressViewLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _presentAreaAndCityLayout(),
        _presentStateAndZipLayout(),
        _presentCountyAndPhoneLayout(),
        customSpacerHeight(height: 24),
      ],
    );
  }

  _presentAreaAndCityLayout() {
    return detailsTextLayout(
      leftTitleText: AppString.text_area,
      rightTitleText: AppString.text_city,
      leftSubtext:
          controller.addressDetailsModel.data?.presentAddress?.area != null
              ? controller.addressDetailsModel.data?.presentAddress?.area
                      .toString() ??
                  ""
              : AppString.text_not_added_yet,
      rightSubtext:
          controller.addressDetailsModel.data?.presentAddress?.city != null
              ? controller.addressDetailsModel.data?.presentAddress?.city
                      .toString() ??
                  ""
              : AppString.text_not_added_yet,
    );
  }

  _presentStateAndZipLayout() {
    return detailsTextLayout(
      leftTitleText: AppString.text_state,
      rightTitleText: AppString.text_zip_code,
      leftSubtext:
          controller.addressDetailsModel.data?.presentAddress?.state != null
              ? controller.addressDetailsModel.data?.presentAddress?.state
                      .toString() ??
                  ""
              : AppString.text_not_added_yet,
      rightSubtext:
          controller.addressDetailsModel.data?.presentAddress?.zipCode != null
              ? controller.addressDetailsModel.data?.presentAddress?.zipCode
                      .toString() ??
                  ""
              : AppString.text_not_added_yet,
    );
  }

  _presentCountyAndPhoneLayout() {
    return detailsTextLayout(
      leftTitleText: AppString.text_county,
      rightTitleText: AppString.text_phone,
      leftSubtext:
          controller.addressDetailsModel.data?.presentAddress?.country != null
              ? controller.addressDetailsModel.data?.presentAddress?.country
                      .toString() ??
                  ""
              : AppString.text_not_added_yet,
      rightSubtext:
          controller.addressDetailsModel.data?.presentAddress?.phoneNumber !=
                  null
              ? controller.addressDetailsModel.data?.presentAddress?.phoneNumber
                      .toString() ??
                  ""
              : AppString.text_not_added_yet,
    );
  }
}

Future _deletedAlert({required context, required addressType}) {
  return customDialogLayout(
      controller: Get.find<AddressController>(),
      onAction: () {
        Get.find<AddressController>()
            .deletedEmployeeAddress(addressType: addressType, context: context)
            .then((value) {
          Get.find<AddressController>().getEmployeeAddress();
        });
      });
}
