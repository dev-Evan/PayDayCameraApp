import 'dart:isolate';
import 'dart:ui';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadHelper extends GetxController {
  void initState() {
    IsolateNameServer.registerPortWithName(receivePort.sendPort, "Downloading");
    receivePort.listen((message) {});
    FlutterDownloader.registerCallback(_downloadCallback);
  }

  ReceivePort receivePort = ReceivePort();

  downloadFile({required String url}) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final baseStorage = await getExternalStorageDirectory();
      final id = await FlutterDownloader.enqueue(

          url: url, savedDir: baseStorage!.path, fileName: "File",
        headers: {'Authorization': 'Bearer ${GetStorage().read(AppString.ACCESS_TOKEN)}'},


      );


    } else {
      print("No Permission");
    }
  }

  _downloadCallback(String id, int status, int progress) {
    SendPort? sendPort = IsolateNameServer.lookupPortByName("Downloading");
    sendPort!.send(progress);
  }
}
