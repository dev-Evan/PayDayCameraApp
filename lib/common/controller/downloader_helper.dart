import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/utils/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../utils/app_string.dart';

class DownloadHelper extends GetxController {
  @override
  void onInit() {
    IsolateNameServer.registerPortWithName(_port.sendPort, "Downloading");
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
    final status = await Permission.storage.request();
    if (status.isGranted) {
      print("${status.isGranted}");
      final String? baseStorage = await getDownloadPath();
      try{await FlutterDownloader.enqueue(
        url: url,
        savedDir: baseStorage!.path,
        fileName: fileInfo ?? "File",
        headers: _setHeaders(),
        showNotification: true,
        openFileFromNotification: true,
      );}catch(e){print(e.toString());}
    } else {
      errorSnackBar(errorMessage: AppString.storage_permission);
    }
  }

  var token = GetStorage().read(AppString.ACCESS_TOKEN);
  _setHeaders() => {
        'Authorization': 'Bearer $token',
        'Accept': '*/*',
      };

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('Downloading');
    super.dispose();
  }

  static void downloadCallback(String id, int status, int progress) {
    SendPort? sendPort = IsolateNameServer.lookupPortByName("Downloading");
    sendPort!.send(progress);
  }
}
