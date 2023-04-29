import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/more/data/deleted_address_repo.dart';
import 'package:pay_day_mobile/modules/more/data/deleted_document_repo.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../../../common/widget/custom_alert_dialog.dart';

class DeletedDocumentController extends GetxController with StateMixin {
  final _box=GetStorage();
  final DeleteDocumentRepository deleteDocumentRepository =
  DeleteDocumentRepository(NetworkClient());
  void deletedDocumentApi() async {
    change(null, status: RxStatus.loading());
    try {
      await deleteDocumentRepository
          .deletedDocRepo(
        _box.read(AppString.ID_STORE).toString(),

      ).then((value) {
        _successDialog();
      }, onError: (error) {
        print(error.toString());
      });
    } catch (ex) {
      _showToast(ex.toString());
    }
    change(null, status: RxStatus.success());
  }
}

_showToast(message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColor.hintColor,
    textColor: Colors.white,
    fontSize: 16.0);


Future _successDialog(){
  return CustomSuccessAlertDialog(
    context: Get.context,
    titleText: AppString.text_success,
    icon:Icons.check,
    iconColor: AppColor.successColor,
    iconBgColor: AppColor.successColor.withOpacity(0.2),
    contentText: AppString.text_deleted_document_successfully,
    popupAction: (){},
  );
}