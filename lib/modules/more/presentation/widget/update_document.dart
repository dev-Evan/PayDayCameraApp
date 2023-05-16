import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';

import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/document_upload_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/update_document_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/job_his_job_title.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../../common/widget/custom_double_button.dart';
import '../../../../common/widget/text_field.dart';
import '../controller/document_controller.dart';

class UpdateDocument extends StatefulWidget {
  const UpdateDocument({Key? key}) : super(key: key);

  @override
  State<UpdateDocument> createState() => _AddDocumentState();
}

class _AddDocumentState extends State<UpdateDocument> {
  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickFile;
  bool isLoading = false;
  File? fileToDisplay;

  void pickFile1() async {
    try {
      setState(() {
        isLoading = false;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          fileName = result!.files.first.name;
          pickFile = result!.files.first;
          fileToDisplay = File(pickFile!.path.toString());
        });
      }
    } catch (e) {
      print(e);
    }
  }

  UpdateDocumentController updateDocumentController =
      Get.put(UpdateDocumentController());
  DocumentController documentController = Get.put(DocumentController());

  @override
  Widget build(BuildContext context) {
    final _box=GetStorage();
    return Column(
      children: [
        bottomSheetAppbar(
            context: context,
            appbarTitle: "${AppString.text_edit} ${AppString.text_documents}"),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFieldTitleText(titleText: AppString.text_name),
                  CustomTextFeild(
                      hintText: _box.read(AppString.STORE_DOC_NAME)??
                          "",
                      inputType: TextInputType.text,
                      controller:
                          updateDocumentController.docNameController.value),
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
                      child: InkWell(
                    onTap: () => pickFile1(),
                    child: fileToDisplay != null
                        ? Container(
                            height: AppLayout.getHeight(100),
                            decoration: BoxDecoration(
                              color: AppColor.disableColor.withOpacity(0.4),
                              //image: DecorationImage(image: Image.file(fileToDisplay.path.toString() as File).image)

                              image: DecorationImage(
                                  image: FileImage(
                                      File(fileToDisplay?.path ?? "").absolute),
                                  fit: BoxFit.cover),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                _fileTitle(
                                    text: documentController.documentModel?.data
                                            ?.documents?.first.name ??
                                        "",
                                ),
                                customSpacerHeight(height: 16),
                                _changeFile()
                              ],
                            ),
                          ),
                  )),
                  customSpacerHeight(height: 8),
                  fileName != null
                      ? Text(
                          fileName.toString(),
                          style: AppStyle.mid_large_text.copyWith(
                              color: AppColor.hintColor,
                              fontSize: Dimensions.fontSizeDefault - 2),
                        )
                      : const Text(""),
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
              elevatedButtonAction: () =>
                  updateDocumentController.uploadDocument(fileToDisplay!.path),
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
     const Icon(CupertinoIcons.doc_fill,color: AppColor.primaryColor,),

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
    dashPattern: [8, 6],
    strokeWidth: AppLayout.getWidth(2),
    child: SizedBox(
      height: AppLayout.getHeight(90),
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
