import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pay_day_mobile/common/widget/error_message.dart';
import 'package:pay_day_mobile/common/widget/success_message.dart';
import 'package:pay_day_mobile/utils/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../utils/app_string.dart';
import 'package:http/http.dart';

class DownloadHelper extends GetxController {
  Future<String?> _getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
        // ignore: avoid_slow_async_io
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      LoggerHelper.errorLog(message: "Cannot get download folder path");
    }
    return directory?.path;
  }

  downloadFile({required String url, String? fileInfo}) async {
    PermissionStatus permissionStatus;
    final deviceInfo = await DeviceInfoPlugin().androidInfo;

    if (deviceInfo.version.sdkInt > 32) {
      permissionStatus = await Permission.photos.request();
    } else {
      permissionStatus = await Permission.storage.request();
    }

    if (permissionStatus.isGranted) {
      showSuccessMessage(message: "Download Started");
      Future.delayed(const Duration(milliseconds: 2600), () async {
        final Request request = Request('GET', Uri.parse(url));
        request.headers.addAll(_setHeaders());
        final StreamedResponse response = await Client().send(request);
        List<int> bytes = [];
        String? pathName = await _getDownloadPath();
        String fileName = await _extractFileNameFromUrl(url);
        final file = await _getFile(pathName,fileInfo ?? fileName);
        response.stream.listen((value) {
          bytes.addAll(value);
        }, onDone: () async {
          await file
              .writeAsBytes(bytes)
              .then((value) => showSuccessMessage(message: "Download Completed"));
        });
      });
    } else if (permissionStatus.isPermanentlyDenied) {
      openAppSettings();
    } else {
      showErrorMessage(errorMessage: AppString.storage_permission);
    }
  }

  var token = GetStorage().read(AppString.ACCESS_TOKEN);

  _setHeaders() => {
        'Authorization': 'Bearer $token',
        'Accept': '*/*',
      };


  Future<File> _getFile(path, fileName) async {
    print('$path/$fileName');
    return File('$path/$fileName');
  }

  Future<String> _extractFileNameFromUrl(String url) async {
    Uri uri = Uri.parse(url);
    return uri.pathSegments.last;
  }
}
