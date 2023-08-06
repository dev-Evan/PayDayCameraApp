import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pay_day_mobile/common/widget/error_message.dart';
import 'package:pay_day_mobile/common/widget/success_message.dart';
import 'package:pay_day_mobile/utils/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../utils/app_string.dart';

class DownloadHelper extends GetxController {
  @override
  void onInit() {
    IsolateNameServer.registerPortWithName(
        _port.sendPort, "downloader_send_port");
    FlutterDownloader.registerCallback(downloadCallback);
    super.onInit();
  }

  final ReceivePort _port = ReceivePort();

  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        LoggerHelper.infoLog(message: "${Platform.isIOS}");
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

  downloadFile({required String url, fileInfo}) async {
    PermissionStatus permissionStatus;
    final deviceInfo = await DeviceInfoPlugin().androidInfo;

    if (deviceInfo.version.sdkInt > 32) {
      permissionStatus = await Permission.photos.request();
    } else {
      permissionStatus = await Permission.storage.request();
    }
    if (permissionStatus.isGranted) {
      final String? baseStorage = await getDownloadPath();
      try {
        await FlutterDownloader.enqueue(
          url: url,
          savedDir: baseStorage!,
          fileName: fileInfo ?? "File",
          headers: _setHeaders(),
          showNotification: true,
          openFileFromNotification: true,
        );
      } catch (e) {
        print(e.toString());
      }
    }else if (permissionStatus.isPermanentlyDenied) {
      openAppSettings();
    }else {
      showErrorMessage(errorMessage: AppString.storage_permission);
    }
  }

  var token = GetStorage().read(AppString.ACCESS_TOKEN);

  _setHeaders() => {
        'Authorization': 'Bearer $token',
        'Accept': '*/*',
      };


  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')

  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  String extractFileNameFromUrl(String url) {
    Uri uri = Uri.parse(url);
    return uri.pathSegments.last;
  }

  downloadFileForAndroid({required String url, fileInfo}) async {

    PermissionStatus permissionStatus;
    final deviceInfo = await DeviceInfoPlugin().androidInfo;

    if (deviceInfo.version.sdkInt > 32) {
      permissionStatus = await Permission.photos.request();
    } else {
      permissionStatus = await Permission.storage.request();
    }
    if (permissionStatus.isGranted) {
      showSuccessMessage(message: "Download Started");
      Future.delayed(const Duration(milliseconds: 2600),(){
        try {
          FileDownloader.downloadFile(
              url: url,
              name: extractFileNameFromUrl(url),
              onProgress: (fileName, progress) {},
              onDownloadCompleted: (String path) {
                showSuccessMessage(message: "Download Completed");
              },
              onDownloadError: (String error) {
                showErrorMessage(errorMessage: "Something went wrong! \n$error");
              });
        } catch (e) {
          print(e.toString());
        }
      });
    }else if (permissionStatus.isPermanentlyDenied) {
      openAppSettings();
    } else {
      showErrorMessage(errorMessage: AppString.storage_permission);
    }
  }
}
