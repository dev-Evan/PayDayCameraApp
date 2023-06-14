import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/custom_alert_dialog.dart';
import 'package:pay_day_mobile/modules/more/data/deleted_document_repo.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/document_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class DeletedDocumentController extends GetxController with StateMixin {
  final _box = GetStorage();
 var newValue="";
  final DeleteDocumentRepository deleteDocumentRepository =
      DeleteDocumentRepository(NetworkClient());
  void deletedDocumentApi() async {
    waitingLoader();
    try {
      await deleteDocumentRepository
          .deletedDocRepo(
        _box.read(AppString.STORE_DOC_Id).toString(),
      )
          .then((value) {
        Get.back();
        newValue="value";
        Get.find<DocumentController>().getDocumentData();
      }, onError: (error) {
        Get.back();
        print("Deleted document ::: ${error}");
      });
    } catch (ex) {
      print("Deleted document ::: ${ex}");
    }
    change(null, status: RxStatus.success());
  }
}
