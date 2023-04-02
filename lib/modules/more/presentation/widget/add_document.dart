import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/custom_button.dart';
import 'package:pay_day_mobile/common/custom_double_button.dart';
import 'package:pay_day_mobile/common/text_field.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class AddDocument extends StatefulWidget {
  const AddDocument({Key? key}) : super(key: key);

  @override
  State<AddDocument> createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  final TextEditingController _documetController = TextEditingController();
  FilePickerResult? result;

  String? fileName;

  PlatformFile? pickFile;

  bool isLoading = false;

  File fileToDisplay = File('');

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bottomSheetAppbar(
            context: context, appbarTitle: AppString.text_add_documents),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.text_name,
                    style: AppStyle.small_text.copyWith(
                        color: AppColor.hintColor,
                        fontSize: Dimensions.fontSizeDefault + 1),
                  ),
                  CustomTextFeild(hintText: AppString.text_enter_document_name,
                      inputType: TextInputType.text,controller:  _documetController),
                ],
              ),
              SizedBox(
                height: AppLayout.getHeight(20),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.text_documents,
                    style: AppStyle.small_text.copyWith(
                        color: AppColor.hintColor,
                        fontSize: Dimensions.fontSizeDefault + 1),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(20),
                  ),
                  DottedBorder(
                    radius: Radius.circular(Dimensions.radiusMid),
                    color: AppColor.disableColor,
                    strokeCap: StrokeCap.square,
                    dashPattern: [8, 6],
                    strokeWidth: 2,
                    child: InkWell(
                      onTap: ()=>pickFile1(),
                      child: Container(
                        height: 100,
                        color: AppColor.disableColor.withOpacity(0.4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(CupertinoIcons.link),
                            SizedBox(
                              width: AppLayout.getWidth(6),
                            ),
                            Text(
                              AppString.text_click,
                              style: AppStyle.mid_large_text.copyWith(
                                  color: AppColor.primaryColor,
                                  fontSize: Dimensions.fontSizeDefault),
                            ),
                            SizedBox(
                              width: AppLayout.getWidth(6),
                            ),
                            Text(
                              AppString.text_to_add_fils,
                              style: AppStyle.mid_large_text.copyWith(
                                  color: AppColor.hintColor,
                                  fontSize: Dimensions.fontSizeDefault + 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(8),
                  ),
                  Text(
                    AppString.text_jpeg_jpg_png_etc,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.hintColor,
                        fontSize: Dimensions.fontSizeDefault - 2),
                  ),
                ],
              ),
            ],
          ),
        ),

        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: customDoubleButton(
              textButtonAction: () =>Get.back(),
              elevatedButtonAction: () {},
              textBtnText: AppString.text_cancel,
              elevatedBtnText: AppString.text_save,
              context: context),
        ),
      ],
    );
  }
}
