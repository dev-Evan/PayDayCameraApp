import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/data/document_upload_repo.dart';
import 'package:pay_day_mobile/utils/app_color.dart';

class DocumentUploadController extends GetxController {
  DocumentUploadRepo documentRepository =DocumentUploadRepo();
  final fileNameController = TextEditingController();
  uploadDocument(String filePath) async{
    await documentRepository.uploadDocumentRepo(
        filePath:  filePath.toString(), fileName: fileNameController.text.toString(),
    ).then((value) {
     print(value.toString());

    }, onError: (error) {
      print(error.message);
    });
  }
}

showToast(message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColor.hintColor,
    textColor: Colors.white,
    fontSize: 16.0);