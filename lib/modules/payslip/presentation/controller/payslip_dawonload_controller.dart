import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:permission_handler/permission_handler.dart';


class PayslipDownlaodController extends GetxController with StateMixin{

  var url=AppString.BASE_URL+AppString.PAYSLIP_DOWNLOAD;
  Future<void> payslipDownload({required id,required token,required date}) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    if (statuses[Permission.storage]!.isGranted) {
       final uri = Uri.parse("$url$id?download=true")
          .replace(queryParameters: {'download':'true'});
      final response = await http.get(
        uri,
        headers: {
          'Authorization':'Bearer $token'
        },
      );
      final directory = await getExternalStorageDirectory();
      final path = '${directory!.path}/Payslip for $date.pdf';
      final bytes = response.bodyBytes;
      final file = File(path);
      await file.writeAsBytes(bytes);
      if(response.statusCode==200){
        _showToast(AppString.text_payslip_download_successfully);
        Get.back();
      }else{
        _showToast(AppString.text_something_wrong);
      }
      print(file);
    }
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







