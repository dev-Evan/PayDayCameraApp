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
import '../../../../common/widget/loading_indicator.dart';
import '../../../../common/widget/success_snakbar.dart';
import '../controller/documet_controller/document_controller.dart';
import '../view/change_password.dart';

// ignore: must_be_immutable
class UpdateDocument extends StatelessWidget {
  String? docUrl;
  UpdateDocument({Key? key, this.docUrl}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print(docUrl.toString());
    final _box = GetStorage();

    return Form(
      key: _formKey,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  bottomSheetAppbar(
                      context: context,
                      appbarTitle:
                      "${AppString.text_edit} ${AppString.text_documents}",
                      onAction: () => Get.find<InputTextFieldController>()
                          .docFileNameController
                          .clear()),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textFieldTitleText(titleText: AppString.text_name),
                            CustomTextField(
                              hintText: AppString.text_enter_document_name,
                              inputType: TextInputType.text,
                              controller: Get.find<InputTextFieldController>()
                                  .docFileNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppString.the_document_field_is_required;
                                }
                                return null;
                              },
                            ),
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
                                    onTap: () => Get.find<UpdateDocumentController>().storageForUpdate
                                        .pickFile(),
                                    child: Get.find<UpdateDocumentController>().storageForUpdate
                                        .filePath
                                        .endsWith(".pdf")
                                        ? Container(
                                      height: AppLayout.getHeight(100),
                                      color: AppColor.disableColor
                                          .withOpacity(0.7),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          _fileTitle(
                                            text: _box.read(AppString
                                                .STORE_DOC_NAME_TEXT) ??
                                                "",
                                          ),
                                          customSpacerHeight(height: 16),
                                          _changeFile()
                                        ],
                                      ),
                                    )
                                        : Get.find<UpdateDocumentController>().storageForUpdate
                                        .filePath
                                        .startsWith("https://")
                                        ? Container(
                                      height: AppLayout.getHeight(100),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: networkImage(
                                                path: Get.find<
                                                    UpdateDocumentController>().storageForUpdate
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
                                                UpdateDocumentController>().storageForUpdate
                                                .filePath
                                                .value
                                                .toString())
                                                .absolute),
                                            fit: BoxFit.cover),
                                      ),
                                    )))),
                            customSpacerHeight(height: 8),
                            Obx(() => Get.find<UpdateDocumentController>().storageForUpdate
                                .filePath
                                .value
                                .isNotEmpty
                                ? Text(
                              Get.find<UpdateDocumentController>().storageForUpdate
                                  .filePath
                                  .value
                                  .toString()
                                  .split('/')
                                  .last,
                              style: AppStyle.mid_large_text.copyWith(
                                  color: AppColor.hintColor,
                                  fontSize: Dimensions.fontSizeDefault - 2),
                            )
                                : const Text("")),
                            customSpacerHeight(height: 8),
                            alertBox(
                                context: context,
                                alertText:
                                AppString.text_document_size_allowed_5_md_etc),
                          ],
                        ),
                      ],
                    ),
                  ),
                  customSpacerHeight(height: 78)
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buttonLayout(context),
            ),

          ],
        ),
      ),
    );
  }

  _buttonLayout(BuildContext context) {
    return   Obx(() =>  Get.find<UpdateDocumentController>(). storageForUpdate.isLoading.isTrue?

    _loadingLayout():  Padding(
      padding: const EdgeInsets.all(16.0),
      child: customDoubleButton(
          textButtonAction: () => Get.back(),
          elevatedButtonAction: () {
            if (_formKey.currentState!.validate()) {
              Get.find<UpdateDocumentController>().storageForUpdate
                  .filePath
                  .startsWith("https://")
                  ? showCustomSnackBar(
                message: AppString.text_please_selected_document,
              )
                  : Get.find<UpdateDocumentController>()
                  .updateDocFile(context: context).then((value){
                Get.back(canPop: false);
                Get.find<DocumentController>().getDocumentData();
              });
            }
          },
          textBtnText: AppString.text_cancel,
          elevatedBtnText: AppString.text_save,
          context: context),
    ));

  }

  _loadingLayout() {
    return Container(margin:  EdgeInsets.only(bottom: AppLayout.getHeight(30)),
      child: loadingIndicatorLayout(),);
  }
}

Widget _fileTitle({required text}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.doc_fill,
            color: AppColor.primaryColor,
          ),
          customSpacerWidth(width: 8),
          Expanded(
            child: Text(
              text,
              style: AppStyle.mid_large_text.copyWith(
                  color: AppColor.normalTextColor,
                  fontSize: Dimensions.fontSizeDefault),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _dottedBorder({required child}) {
  return DottedBorder(
    radius: Radius.circular(Dimensions.radiusMid),
    color: AppColor.disableColor,
    strokeCap: StrokeCap.square,
    dashPattern: [8, 6],
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
