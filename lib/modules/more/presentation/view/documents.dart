import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/documet_controller/document_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/documet_controller/update_document_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/view_doc_file.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/update_document.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customMoreAppbar(
                  titleText: controller.documentModel.message ??
                      AppString.text_documents,
                  onAction: () => Get.back()),
              (controller.documentModel.data?.documents != null &&
                      controller.documentModel.data!.documents!.isNotEmpty)
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
                                padding: EdgeInsets.only(
                                    top: AppLayout.getHeight(0),
                                    bottom: AppLayout.getHeight(20),
                                    left: AppLayout.getWidth(20),
                                    right: AppLayout.getWidth(20)),
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 8,
                                        child: ListView.builder(
                                          itemCount: controller.documentModel
                                              .data?.documents?.length,
                                          shrinkWrap: true,

                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () => CustomNavigator(
                                                  context: context,
                                                  pageName: _selectedPage(
                                                      fullUrl: controller
                                                              .documentModel
                                                              .data
                                                              ?.documents?[
                                                                  index]
                                                              .fullUrl ??
                                                          "",
                                                      docText: controller
                                                              .documentModel
                                                              .data
                                                              ?.documents?[
                                                                  index]
                                                              .name ??
                                                          AppString
                                                              .text_documents)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Card(
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: AppLayout
                                                              .getWidth(0.3),
                                                          color: AppColor
                                                              .hintColor),
                                                      borderRadius: BorderRadius
                                                          .circular(Dimensions
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
                                                                  ?.documents?[
                                                                      index]
                                                                  .fullUrl ??
                                                              "",
                                                        ),
                                                      ),
                                                      Expanded(
                                                          flex: 8,
                                                          child: _cardImgTitle(
                                                              titleText: controller
                                                                      .documentModel
                                                                      .data
                                                                      ?.documents?[
                                                                          index]
                                                                      .name ??
                                                                  "",
                                                              sizeText: "",
                                                              id: controller
                                                                      .documentModel
                                                                      .data
                                                                      ?.documents?[
                                                                          index]
                                                                      .id ??
                                                                  "",
                                                              docText: controller
                                                                      .documentModel
                                                                      .data
                                                                      ?.documents?[
                                                                          index]
                                                                      .name ??
                                                                  "",
                                                              docUrl: controller
                                                                      .documentModel
                                                                      .data
                                                                      ?.documents?[
                                                                          index]
                                                                      .fullUrl ??
                                                                  "",
                                                              context:
                                                                  context)),
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
                            ),
                            customSpacerHeight(height: 52)
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          svgIcon(
                            height: 160,
                            width: 160,
                            url: Images.no_data_found,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 2.5,
                          )
                        ],
                      ),
                    ),
            ],
          ),
        ),
        floatingActionButton: _addDocumentBtn());
  }

  Widget _addDocumentBtn() {
    return Padding(
      padding: EdgeInsets.only(
          left: AppLayout.getWidth(30),
          top: AppLayout.getHeight(8),
          bottom: AppLayout.getHeight(8)),
      child: CustomButton(AppString.text_add_documents, () {
        customButtonSheet(
            context: Get.context, height: 0.9, child: const AddDocument());
      }),
    );
  }

  Widget _cardImage({required imageUrl}) {
    GetStorage().write("key", imageUrl);
    return Container(
      height: AppLayout.getHeight(66),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radiusDefault),
            bottomLeft: Radius.circular(Dimensions.radiusDefault)),
        child: imageUrl.endsWith(".pdf")
            ? _fileIcon()
            : FadeInImage(
                image: NetworkImage(imageUrl),
                placeholder: AssetImage(Images.placeholder),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: AppLayout.getHeight(66),
                    decoration: AppStyle.ContainerStyle.copyWith(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radiusDefault),
                            bottomLeft:
                                Radius.circular(Dimensions.radiusDefault)),
                        image: DecorationImage(
                            image: AssetImage(Images.placeholder),
                            fit: BoxFit.cover)),
                  );
                },
                fit: BoxFit.cover,
              ),
      ),
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
      color: AppColor.primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radiusMid - 4),
          bottomLeft: Radius.circular(Dimensions.radiusMid - 4)),
    ),
    child: const Icon(
      CupertinoIcons.doc,
      size: 30,
      color: AppColor.primaryColor,
    ),
  );
}

Widget _cardImgTitle(
    {required titleText,
    required sizeText,
    required id,
    required docText,
    required docUrl,
    required context}) {
  final box = GetStorage();
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
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.4,
                  child: Text(
                    titleText,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      IconButton(
          onPressed: () {
            box.write(AppString.STORE_DOC_NAME_TEXT, docText);

            SchedulerBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault),
                    ),
                    actions: [
                      _editDeletedActionRow(
                          context: context, id: id, docUrl: docUrl),
                    ],
                  );
                },
              );
            });
          },
          icon: const Icon(Icons.more_vert))
    ],
  ));
}

Widget _editDeletedActionRow({required context, required id, required docUrl}) {
  final _box = GetStorage();
  return Row(
    children: [
      InkWell(
        onTap: () {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            customButtonSheet(
                context: context,
                height: 0.9,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: UpdateDocument(
                    docUrl: docUrl,
                  ),
                ));
          });

          if (Get.find<UpdateDocumentController>()
              .newValue
              .toString()
              .isNotEmpty) {
            Navigator.pop(context);
          } else {
            Navigator.pop(context);
          }

          Get.find<UpdateDocumentController>().filePath.value = docUrl;
          _box.write(AppString.STORE_DOC_Id, id);
          Get.find<InputTextFieldController>().docFileNameController.text =
              _box.read(AppString.STORE_DOC_NAME_TEXT) ?? "";
        },
        child: _iconShape(icon: Icons.edit, text: AppString.text_edit),
      ),
      customSpacerWidth(width: 40),
      InkWell(
        onTap: () {
          if (Get.find<DocumentController>().newValue.toString().isNotEmpty) {
            Navigator.pop(context);
          } else {
            Navigator.pop(context);
          }
          _box.write(AppString.STORE_DOC_Id, id);
          Get.find<DocumentController>().deletedDocumentApi();
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
