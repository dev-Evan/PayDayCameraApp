// import 'dart:io';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart';
// import 'package:pay_day_mobile/utils/app_string.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class PayslipDownloadDemo extends StatefulWidget {
//   const PayslipDownloadDemo({Key? key}) : super(key: key);
//
//   @override
//   State<PayslipDownloadDemo> createState() => _PayslipDownloadDemoState();
// }
//
// class _PayslipDownloadDemoState extends State<PayslipDownloadDemo> {
//
//   late String _localPath;
//   late bool _permissionReady;
//   late TargetPlatform? platform;
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     if (Platform.isAndroid) {
//       platform = TargetPlatform.android;
//     } else {
//       platform = TargetPlatform.iOS;
//     }
//   }
//
//   Future<void> _prepareSaveDir() async {
//     _localPath = (await _findLocalPath())!;
//
//     print(_localPath);
//     final savedDir = Directory(_localPath);
//     bool hasExisted = await savedDir.exists();
//     if (!hasExisted) {
//       savedDir.create();
//     }
//   }
//
//   Future<String?> _findLocalPath() async {
//     if (platform == TargetPlatform.android) {
//       return "/storage/emulated/0/Download";
//     } else {
//       var directory = await getApplicationDocumentsDirectory();
//       return directory.path + Platform.pathSeparator + 'Download';
//     }
//   }
//
//   Future<bool> _checkPermission() async {
//     if (platform == TargetPlatform.android) {
//       final status = await Permission.storage.status;
//       if (status != PermissionStatus.granted) {
//         final result = await Permission.storage.request();
//         if (result == PermissionStatus.granted) {
//           return true;
//         }
//       } else {
//         return true;
//       }
//     } else {
//       return true;
//     }
//     return false;
//   }
//
//   final manager = StateManager();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             InkWell(
//                 onTap: () async {
//                   _permissionReady = await _checkPermission();
//                   if (_permissionReady) {
//                     await _prepareSaveDir();
//                     print("Downloading");
//                     try {
//                       await Dio().download("https://cdn.pixabay.com/photo/2023/05/23/15/26/bengal-cat-8012976_1280.jpg",
//                           _localPath + "/" + "filename.jpg");
//                       print("Download Completed.");
//                     } catch (e) {
//                       print("Download Failed.\n\n" + e.toString());
//                     }
//                   }
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle, color: Colors.grey.withOpacity(0.5)),
//                   padding: EdgeInsets.all(8),
//                   child: Icon(Icons.download, color: Colors.black),
//                 )),
//             Text("data"),
//
//       Stack(
//         children: <Widget>[
//           Center(
//             child: SizedBox(
//               width: 100,
//               height: 100,
//               child: ValueListenableBuilder<double?>(
//                 valueListenable: manager.progressNotifier,
//                 builder: (context, percent, child) {
//                   return CircularProgressIndicator(
//                     strokeWidth: 20,
//                     value: percent,
//                   );
//                 },
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: ElevatedButton(
//                 onPressed: manager.startDownloading,
//                 child: const Text('Download file'),
//               ),
//             ),
//           ),
//         ],
//       )
//
//
//
//
//
//
//
//
//           ],
//         ),
//
//       ),
//     );
//   }
// }
//
//
// class StateManager {
//   final progressNotifier = ValueNotifier<double?>(0);
//
//   void startDownloading() async {
//     progressNotifier.value = null;
//     const url = 'https://www.ssa.gov/oact/babynames/names.zip';
//
//     //const url = 'https://cdn.pixabay.com/photo/2023/05/23/15/26/bengal-cat-8012976_1280.jpg';
//     // final uri = Uri.parse("$url$id?download=true")
//     //     .replace(queryParameters: {'download': 'true'});
//     // final response = await http.get(
//     //   uri,
//     //   headers: {'Authorization': 'Bearer $token'},
//     // );
//     //
//
//     final request = Request('GET', Uri.parse(url));
//     final StreamedResponse response = await Client().send(request);
//
//     final contentLength = response.contentLength;
//     // final contentLength = double.parse(response.headers['x-decompressed-content-length']);
//
//     progressNotifier.value = 0;
//
//     List<int> bytes = [];
//
//     final file = await _getFile('names.zip');
//     response.stream.listen(
//           (List<int> newBytes) {
//         bytes.addAll(newBytes);
//         final downloadedLength = bytes.length;
//         progressNotifier.value = downloadedLength / contentLength!;
//       },
//       onDone: () async {
//         progressNotifier.value = 0;
//         await file.writeAsBytes(bytes);
//       },
//       onError: (e) {
//         debugPrint(e);
//       },
//       cancelOnError: true,
//     );
//   }
//
//   Future<File> _getFile(String filename) async {
//     final dir = await getApplicationDocumentsDirectory();
//     print(dir.path);
//     return File(join(dir.path, filename));
//   }
// }