import 'dart:isolate';
import 'dart:ui';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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
      final id = await FlutterDownloader.enqueue(
        url: url,
        savedDir: baseStorage!.path,
        fileName: "File",
        showNotification: true,
        openFileFromNotification: true,
      );
    } else {
      print("No Permission");
    }
  }
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
