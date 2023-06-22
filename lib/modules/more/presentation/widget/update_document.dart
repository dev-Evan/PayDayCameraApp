import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/custom_double_button.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/documet_controller/update_document_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../../common/widget/success_snakbar.dart';
import '../view/change_password.dart';

class UpdateDocument extends StatelessWidget {
  final String? docUrl;

  const UpdateDocument({Key? key, this.docUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(docUrl.toString());
    final box = GetStorage();
    return Column(
      children: [
        bottomSheetAppbar(
          context: context,
          appbarTitle: "${AppString.text_edit} ${AppString.text_documents}",
          onAction: ()=> Get.find<InputTextFieldController>()
              .docFileNameController.clear()
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFieldTitleText(titleText: AppString.text_name),
                  CustomTextField(
                      hintText: box.read(AppString.STORE_DOC_NAME_TEXT) ?? "",
                      inputType: TextInputType.text,
                      controller: Get.find<InputTextFieldController>()
                          .docFileNameController),
                ],
              ),
              customSpacerHeight(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFieldTitleText(
                    titleText: AppString.text_documents,
                  ),
                  customSpacerHeight(height: 20),
                  _dottedBorder(
                      child: Obx(() => InkWell(
                          onTap: () =>
                              Get.find<UpdateDocumentController>().pickFile(),
                          child: Get.find<UpdateDocumentController>()
                                  .filePath
                                  .endsWith(".pdf")
                              ? Container(
                                  height: AppLayout.getHeight(100),
                                  color: AppColor.disableColor.withOpacity(0.7),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _fileTitle(
                                        text: box.read(AppString
                                                .STORE_DOC_NAME_TEXT) ??
                                            "",
                                      ),
                                      customSpacerHeight(height: 16),
                                      _changeFile()
                                    ],
                                  ),
                                )
                              : Get.find<UpdateDocumentController>()
                                      .filePath
                                      .startsWith("https://")
                                  ? Container(
                                      height: AppLayout.getHeight(100),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: networkImage(
                                                path: Get.find<
                                                        UpdateDocumentController>()
                                                    .filePath
                                                    .value),
                                            fit: BoxFit.cover),
                                      ),
                                    )
                                  : Container(
                                      height: AppLayout.getHeight(100),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: FileImage(File(Get.find<
                                                        UpdateDocumentController>()
                                                    .filePath
                                                    .value
                                                    .toString())
                                                .absolute),
                                            fit: BoxFit.cover),
                                      ),
                                    )))),
                  customSpacerHeight(height: 8),
                  Obx(() => Get.find<UpdateDocumentController>()
                          .filePath
                          .value
                          .isNotEmpty
                      ? Text(
                          Get.find<UpdateDocumentController>()
                              .filePath
                              .value
                              .toString().split('/').last,
                          style: AppStyle.mid_large_text.copyWith(
                              color: AppColor.hintColor,
                              fontSize: Dimensions.fontSizeDefault - 2),
                        )
                      : const Text("")),
                  customSpacerHeight(height: 8),
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
              textButtonAction: () => Get.back(),
              elevatedButtonAction: () {
                Get.find<UpdateDocumentController>()
                        .filePath
                        .startsWith("https://")
                    ? showCustomSnackBar(
                        message: AppString.text_please_selected_document,
                        color: AppColor.errorColor)
                    : Get.find<UpdateDocumentController>()
                        .updateDocFile(context: context);
              },
              textBtnText: AppString.text_cancel,
              elevatedBtnText: AppString.text_save,
              context: context),
        ),
      ],
    );
  }
}

Widget _fileTitle({required text}) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          CupertinoIcons.doc_fill,
          color: AppColor.primaryColor,
        ),
        customSpacerWidth(width: 8),
        Text(
          text,
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeDefault),
        ),
      ],
    ),
  );
}

Widget _dottedBorder({required child}) {
  return DottedBorder(
    radius: Radius.circular(Dimensions.radiusMid),
    color: AppColor.disableColor,
    strokeCap: StrokeCap.square,
    dashPattern: const [8, 6],
    strokeWidth: AppLayout.getWidth(2),
    child: SizedBox(
      height: AppLayout.getHeight(120),
      child: child,
    ),
  );
}

Widget _changeFile() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: AppLayout.getWidth(6),
      ),
      Text(
        AppString.text_change_file,
        style: AppStyle.mid_large_text.copyWith(
            color: AppColor.primaryColor, fontSize: Dimensions.fontSizeDefault),
      ),
    ],
  );
}

NetworkImage networkImage({required path}) {
  return NetworkImage(path);
}
