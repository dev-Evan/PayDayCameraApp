import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_double_button.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/documet_controller/document_upload_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:dotted_border/dotted_border.dart';
import '../view/change_password.dart';

class AddDocument extends StatefulWidget {
  const AddDocument({Key? key}) : super(key: key);
  @override
  State<AddDocument> createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bottomSheetAppbar(
            context: context,
            appbarTitle: AppString.text_add_documents,
            onAction: () {
              Get.find<InputTextFieldController>()
                  .docFileNameController
                  .clear();
              Get.find<FileUploadController>().filePath.value = "";
            }),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFieldTitleText(titleText: AppString.text_name),
                  customSpacerHeight(height: 8),
                  CustomTextField(
                      hintText: AppString.text_enter_document_name,
                      inputType: TextInputType.text,
                      controller: Get.find<InputTextFieldController>()
                          .docFileNameController),
                ],
              ),
              customSpacerHeight(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFieldTitleText(
                    titleText: AppString.text_documents,
                  ),
                  customSpacerHeight(height: 8),

                  _dottedBorder(
                      child: InkWell(
                          onTap: () {
                            Get.find<FileUploadController>().pickFile();
                          },
                          child: Obx(() => Get.find<FileUploadController>()
                                  .filePath
                                  .isNotEmpty
                              ? Get.find<FileUploadController>()
                                      .filePath
                                      .endsWith(".pdf")
                                  ? Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.picture_as_pdf,
                                            color: AppColor.primaryColor,
                                          ),
                                          SizedBox(
                                            width: AppLayout.getWidth(6),
                                          ),
                                          Text(
                                            AppString.text_click,
                                            style: AppStyle.mid_large_text
                                                .copyWith(
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: Dimensions
                                                        .fontSizeDefault),
                                          ),
                                          customSpacerWidth(width: 6),
                                          Text(
                                            AppString.text_to_replace_fil,
                                            style: AppStyle.mid_large_text
                                                .copyWith(
                                                    color: AppColor.hintColor,
                                                    fontSize: Dimensions
                                                            .fontSizeDefault +
                                                        2),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      height: AppLayout.getHeight(100),
                                      decoration: BoxDecoration(
                                        color: AppColor.disableColor
                                            .withOpacity(0.4),
                                        image: DecorationImage(
                                            image: FileImage(File(Get.find<
                                                            FileUploadController>()
                                                        .filePath
                                                        .value)
                                                .absolute),
                                            fit: BoxFit.cover),
                                      ),
                                    )
                              : Container(
                            color: AppColor.disableColor.withOpacity(0.4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        CupertinoIcons.link ,
                                        color: AppColor.primaryColor,
                                      ),
                                      SizedBox(
                                        width: AppLayout.getWidth(6),
                                      ),
                                      Text(
                                        AppString.text_click,
                                        style: AppStyle.mid_large_text.copyWith(
                                            color: AppColor.primaryColor,
                                            fontSize:
                                                Dimensions.fontSizeDefault),
                                      ),
                                      customSpacerWidth(width: 6),
                                      Text(
                                        AppString.text_to_add_fils,
                                        style: AppStyle.mid_large_text.copyWith(
                                            color: AppColor.hintColor,
                                            fontSize:
                                                Dimensions.fontSizeDefault + 2),
                                      ),
                                    ],
                                  ),
                                )))), //),

                  customSpacerHeight(height: 8),
                  Obx(() => Text(
                      Get.find<FileUploadController>().filePath.value.split('/').last,
                      style: AppStyle.mid_large_text.copyWith(
                          color: AppColor.hintColor,
                          fontSize: Dimensions.fontSizeDefault - 2))),
                  alertBox(
                      context: context,
                      alertText: AppString.text_document_size_allowed_5_md_etc),


                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: customDoubleButton(
              textButtonAction: () {
                Get.find<InputTextFieldController>()
                    .docFileNameController
                    .clear();
                Get.back();
                Get.find<FileUploadController>().filePath.value = "";
              },
              elevatedButtonAction: () {
                Get.find<InputTextFieldController>()
                        .docFileNameController
                        .text
                        .isEmpty
                    ? showCustomSnackBar(
                        message: AppString.text_document_name_is_required,
                        color: AppColor.errorColor)
                    : Get.find<FileUploadController>().filePath.isEmpty
                        ? showCustomSnackBar(
                            message: AppString.text_please_selected_document,
                            color: AppColor.errorColor)
                        : Get.find<FileUploadController>()
                            .uploadFile(context: context);
              },
              textBtnText: AppString.text_cancel,
              elevatedBtnText: AppString.text_add_document,
              context: context),
        ),
      ],
    );
  }
}



Widget _dottedBorder({required child}) {
  return DottedBorder(
    radius: Radius.circular(Dimensions.radiusMid),
    color: AppColor.disableColor,
    strokeCap: StrokeCap.square,
    dashPattern: [8, 6],
    strokeWidth: AppLayout.getWidth(2),
    child: SizedBox(
      height: AppLayout.getHeight(140),
      child: child,
    ),
  );
}
