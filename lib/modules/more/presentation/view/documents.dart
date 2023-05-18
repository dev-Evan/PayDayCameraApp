import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/document_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/document_deleted_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/view_doc_file.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/update_document.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../../../common/widget/custom_appbar.dart';
import '../../../../common/widget/custom_buttom_sheet.dart';
import '../../../../common/widget/custom_button.dart';
import '../../../../common/widget/custom_navigator.dart';
import '../widget/add_document.dart';
import '../widget/document_view.dart';
import '../widget/documents_appbar.dart';

class DocumentScreen extends GetView<DocumentController> {
  DocumentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: controller.obx(
        (state) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customMoreAppbar(
                titleText: controller.documentModel.message ??
                    AppString.text_documents,
                onAction: () => Get.back()),
            controller.documentModel.data?.documents != null
                ? Expanded(
                    child: Container(
                      color: AppColor.backgroundColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _fileTitleText(
                              totalFileText: controller
                                      .documentModel.data?.meta?.total
                                      .toString() ??
                                  ""),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Expanded(
                                      child: ListView.builder(
                                    itemCount: controller
                                        .documentModel.data?.documents?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () => CustomNavigator(
                                            context: context,
                                            pageName: _selectedPage(
                                                    fullUrl: controller
                                                            .documentModel
                                                            .data
                                                            ?.documents?[index]
                                                            .fullUrl ??
                                                      "",
                                                    docText: controller
                                                            .documentModel
                                                            .data
                                                            ?.documents?[index]
                                                            .name ??
                                                        AppString
                                                            .text_documents)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width:
                                                        AppLayout.getWidth(0.3),
                                                    color: AppColor.hintColor),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions
                                                            .radiusDefault)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: _cardImage(
                                                    imageUrl: controller
                                                            .documentModel
                                                            .data
                                                            ?.documents?[index]
                                                            .fullUrl ??
                                                        "",
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 8,
                                                    child: _cardImgTitle(
                                                        titleText:
                                                        controller
                                                                    .documentModel
                                                                    .data
                                                                    ?.documents?[
                                                                        index]
                                                                    .name ??
                                                                "",
                                                        sizeText: "",
                                                        id:   controller
                                                            .documentModel
                                                            .data
                                                            ?.documents?[
                                                        index]
                                                            .id ??
                                                            "",
                                                        docText: controller.documentModel
                                                        .data
                                                        ?.documents?[
                                                    index]
                                                        .name ??
                                                        "",
                                                        context: context)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                    AppString.text_no_document_found,
                    style: AppStyle.title_text.copyWith(
                        color: AppColor.normalTextColor,
                        fontSize: Dimensions.fontSizeDefault),
                  )),
            Padding(
              padding: EdgeInsets.only(
                  left: AppLayout.getWidth(8),
                  right: AppLayout.getWidth(8),
                  top: AppLayout.getHeight(8),
                  bottom: AppLayout.getHeight(8)),
              child: CustomButton(AppString.text_add_documents, () {
                customButtomSheet(
                    context: context, height: 0.9, child: const AddDocument());
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardImage({required imageUrl}) {
    return imageUrl.endsWith(".pdf")
        ? _fileIcon()
        : Container(
            height: AppLayout.getHeight(66),
            decoration: AppStyle.ContainerStyle.copyWith(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radiusMid - 4),
                    bottomLeft: Radius.circular(Dimensions.radiusMid - 4)),
                image: DecorationImage(image: NetworkImage(imageUrl))),
          );
  }
}

Widget _documentPage({required imgUrl, required docText}) {
  return DocumentView(
    imageUrl: imgUrl,
    docName: docText,
  );
}

Widget _selectedPage({required fullUrl, required docText}) {
  return fullUrl.endsWith(".pdf")
      ? ViewDocFile(
              path: fullUrl,
              pathName: docText,
            )
      : _documentPage(
          imgUrl: fullUrl,
          docText: docText,
        );
}

Widget _fileIcon() {
  return Container(
    height: AppLayout.getHeight(66),
    decoration: AppStyle.ContainerStyle.copyWith(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radiusMid - 4),
          bottomLeft: Radius.circular(Dimensions.radiusMid - 4)),
    ),
    child: const Icon(
      CupertinoIcons.doc_fill,
      color: AppColor.primaryColor,
    ),
  );
}

Widget _cardImgTitle(
    {required titleText, required sizeText,required id,required docText,required context}) {
  final box=GetStorage();
  return _sizedCardImgTitle(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titleText),
              ],
            ),
          ),
        ],
      ),
      IconButton(
          onPressed: () {
         box.write(AppString.STORE_DOC_NAME_TEXT, docText);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                  ),
                  actions: [
                    _editDeletedActionRow(context: context,id: id),
                  ],
                );
              },
            );

          },
          icon: const Icon(Icons.more_vert))
    ],
  ));
}
Widget _editDeletedActionRow({required context,required id}){
  final _box=GetStorage();
  return Row(
    children: [
      InkWell(
        onTap: () => customButtomSheet(
            context: context,
            height: 0.9,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: UpdateDocument(),
            )),
        child: _iconShape(icon: Icons.edit, text: AppString.text_edit),
      ),
      customSpacerWidth(width: 40),
      InkWell(
        onTap: (){
          _box.write(AppString.STORE_DOC_Id, id);
          Get.find<DeletedDocumentController>().deletedDocumentApi();
          Future.delayed(
              const Duration(seconds: 10),
              ()=> Get.back(),
          );
        },
        child: _iconShape(icon: Icons.delete, text: AppString.text_deleted),
      )
    ],
  );
}

Widget _sizedCardImgTitle({required child}) {
  return Container(
    decoration: AppStyle.ContainerStyle.copyWith(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.radiusMid),
            bottomRight: Radius.circular(Dimensions.radiusMid))),
    child: child,
  );
}

Widget _fileTitleText({required totalFileText}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.text_total_file,
          style: AppStyle.title_text.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeMid),
        ),
        customSpacerHeight(height: 4),
        Text(
          totalFileText,
          style: AppStyle.small_text.copyWith(
              color: AppColor.hintColor, fontSize: Dimensions.fontSizeDefault),
        ),
      ],
    ),
  );
}

Widget _iconShape({required icon, required text}) {
  return Row(
    children: [
      _cardShape(icon: icon),
      customSpacerWidth(width: 6),
      Text(
        text,
        style: AppStyle.title_text.copyWith(
            color: AppColor.normalTextColor,
            fontSize: Dimensions.fontSizeDefault),
      ),
    ],
  );
}

Widget _cardShape({icon}) {
  return Card(
      elevation: 0,
      color: AppColor.primaryColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Center(
          child: Icon(
            icon,
            color: AppColor.primaryColor.withOpacity(0.8),
          ),
        ),
      ));
}
