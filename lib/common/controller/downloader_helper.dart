import 'dart:isolate';
import 'dart:ui';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/app_string.dart';

class DownloadHelper extends GetxController {
  @override
  void onInit() {
    print("onInit called");
    IsolateNameServer.registerPortWithName(_port.sendPort, "Downloading");
    FlutterDownloader.registerCallback(downloadCallback);
    super.onInit();
  }

  final ReceivePort _port = ReceivePort();

  downloadFile({required String url}) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final baseStorage = await getExternalStorageDirectory();
    await FlutterDownloader.enqueue(
        url: url,
        savedDir: baseStorage!.path,
        fileName: "File",
        headers: _setHeaders(),
        showNotification: true,
        openFileFromNotification: true,
      );
    } else {
      print("No Permission");
    }
  }

  var token = GetStorage().read(AppString.ACCESS_TOKEN);

  _setHeaders() => {
    'Authorization' : 'Bearer $token',
    'Accept' : '*/*',
  };

  @override
  void dispose() {
    print("dispose called");
    IsolateNameServer.removePortNameMapping('Downloading');
    super.dispose();
  }

  static void downloadCallback(String id, int status, int progress) {
    SendPort? sendPort = IsolateNameServer.lookupPortByName("Downloading");
    sendPort!.send(progress);
  }
}
