
import 'dart:io';
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

  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
        // ignore: avoid_slow_async_io
        if (!await directory.exists()) directory = await getExternalStorageDirectory();
      }
    } catch (err) {
      print("Cannot get download folder path");
    }
    return directory?.path;
  }


  downloadFile({required String url}) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final baseStorage = await getExternalStorageDirectory();
      print(baseStorage);
      await FlutterDownloader.enqueue(
          url: url,
          allowCellular: true,
          savedDir: baseStorage!.path,
          fileName: "File",
          headers: _setHeaders(),
          showNotification: true,
          openFileFromNotification: true,
          saveInPublicStorage: true);
    } else {
      print("No Permission");
    }
  }

  var token = GetStorage().read(AppString.ACCESS_TOKEN);

  _setHeaders() => {
        'Authorization': 'Bearer $token',
        'Accept': '*/*',
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
