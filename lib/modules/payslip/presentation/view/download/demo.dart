// // import 'dart:io';
// //
// // import 'package:dio/dio.dart';
// // import 'package:flutter/material.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:permission_handler/permission_handler.dart';
// //
// // class DownloadController extends StatefulWidget {
// //   const DownloadController({Key? key}) : super(key: key);
// //
// //   @override
// //   State<DownloadController> createState() => _DownloadControllerState();
// // }
// //
// // class _DownloadControllerState extends State<DownloadController> {
// //   late String _localPath;
// //   late bool _permissionReady;
// //   late TargetPlatform? platform;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     if (Platform.isAndroid) {
// //       platform = TargetPlatform.android;
// //     } else {
// //       platform = TargetPlatform.iOS;
// //     }
// //   }
// //
// //   Future<bool> _checkPermission() async {
// //     if (platform == TargetPlatform.android) {
// //       final status = await Permission.storage.status;
// //       if (status != PermissionStatus.granted) {
// //         final result = await Permission.storage.request();
// //         if (result == PermissionStatus.granted) {
// //           return true;
// //         }
// //       } else {
// //         return true;
// //       }
// //     } else {
// //       return true;
// //     }
// //     return false;
// //   }
// //
// //   Future<void> _prepareSaveDir() async {
// //     _localPath = (await _findLocalPath())!;
// //
// //     print(_localPath);
// //     final savedDir = Directory(_localPath);
// //     bool hasExisted = await savedDir.exists();
// //     if (!hasExisted) {
// //       savedDir.create();
// //     }
// //   }
// //
// //   Future<String?> _findLocalPath() async {
// //     if (platform == TargetPlatform.android) {
// //       return "/sdcard/download/";
// //     } else {
// //       var directory = await getApplicationDocumentsDirectory();
// //       return directory.path + Platform.pathSeparator + 'Download';
// //     }
// //   }
// //
// //   var dio = Dio();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Center(
// //               child: ElevatedButton(
// //                   onPressed: () async {
// //
// //                     _permissionReady = await _checkPermission();
// //                     if (_permissionReady) {
// //                       await _prepareSaveDir();
// //                       print("Downloading");
// //                       try {
// //                         await Dio().download(
// //                             "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
// //                             _localPath + "/" + "filename.pdf");
// //                         print("Download Completed.");
// //                       } catch (e) {
// //                         print("Download Failed.\n\n" + e.toString());
// //                       }
// //                     }
// //                     // Container(
// //                     //   decoration: BoxDecoration(
// //                     //       shape: BoxShape.circle,
// //                     //       color: Colors.grey.withOpacity(0.5)),
// //                     //   padding: EdgeInsets.all(8),
// //                     //   child: Icon(Icons.download, color: Colors.black),
// //                     // )
// //                   },
// //                   child: Text("Click")),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:http/http.dart' as http;
//
// class DownloadController extends StatefulWidget {
//   const DownloadController({Key? key}) : super(key: key);
//
//   @override
//   State<DownloadController> createState() => _DownloadControllerState();
// }
//
// class _DownloadControllerState extends State<DownloadController> {
//   late String _localPath;
//   late bool _permissionReady;
//   late TargetPlatform? platform;
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
//       return "/sdcard/download/";
//     } else {
//       var directory = await getApplicationDocumentsDirectory();
//       return directory.path + Platform.pathSeparator + 'Download';
//     }
//   }
//
//   var dio = Dio();
//
//   var id="4";
//   var url="https://payday.api.php8.gainhq.com/api/payroll/payslip/pdf/";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: ElevatedButton(
//                   onPressed: () async {
//                     _permissionReady = await _checkPermission();
//                     if (_permissionReady) {
//                       await _prepareSaveDir();
//                       print("Downloading");
//                       try {
//
//                    final  uri = Uri.parse("$url$id?download=true")
//                         .replace(queryParameters: {'download':'true'});
//                     final response = await http.get(
//                     uri,
//                     headers: {'Authorization': 'Bearer 1|RNfOpDsc31nlLnx4DZxdoZaTWtuj1G7LYHPQlf04'},
//                     );
//
//                    final path = _localPath + "/" + "filename.pdf";
//                    final bytes = response.bodyBytes;
//                    final file = File(path);
//                    await file.writeAsBytes(bytes);
//
//
//
//
//
//
//
//
//                         // Dio().download(
//                         //     "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
//                         //     _localPath + "/" + "filename.pdf");
//                         print("Download Completed.");
//                       } catch (e) {
//                         print("Download Failed.\n\n" + e.toString());
//                       }
//                     }
//                     // Container(
//                     //   decoration: BoxDecoration(
//                     //       shape: BoxShape.circle,
//                     //       color: Colors.grey.withOpacity(0.5)),
//                     //   padding: EdgeInsets.all(8),
//                     //   child: Icon(Icons.download, color: Colors.black),
//                     // )
//                   },
//                   child: Text("Click")),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class DownloadController extends StatefulWidget {
//   const DownloadController({Key? key}) : super(key: key);
//
//   @override
//   State<DownloadController> createState() => _DownloadControllerState();
// }
//
// class _DownloadControllerState extends State<DownloadController> {
//   late String _localPath;
//   late bool _permissionReady;
//   late TargetPlatform? platform;
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
//       return "/sdcard/download/";
//     } else {
//       var directory = await getApplicationDocumentsDirectory();
//       return directory.path + Platform.pathSeparator + 'Download';
//     }
//   }
//
//   var dio = Dio();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: ElevatedButton(
//                   onPressed: () async {
//
//                     _permissionReady = await _checkPermission();
//                     if (_permissionReady) {
//                       await _prepareSaveDir();
//                       print("Downloading");
//                       try {
//                         await Dio().download(
//                             "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
//                             _localPath + "/" + "filename.pdf");
//                         print("Download Completed.");
//                       } catch (e) {
//                         print("Download Failed.\n\n" + e.toString());
//                       }
//                     }
//                     // Container(
//                     //   decoration: BoxDecoration(
//                     //       shape: BoxShape.circle,
//                     //       color: Colors.grey.withOpacity(0.5)),
//                     //   padding: EdgeInsets.all(8),
//                     //   child: Icon(Icons.download, color: Colors.black),
//                     // )
//                   },
//                   child: Text("Click")),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class DownloadController extends StatefulWidget {
  const DownloadController({Key? key}) : super(key: key);

  @override
  State<DownloadController> createState() => _DownloadControllerState();
}

class _DownloadControllerState extends State<DownloadController> {
  late String _localPath;
  late bool _permissionReady;
  late TargetPlatform? platform;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }
  }

  Future<bool> _checkPermission() async {
    if (platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath())!;

    print("Local path::: $_localPath");
    final Directory savedDir = Directory(_localPath);
    print("Dir :: $savedDir");
    bool hasExisted = await savedDir.exists();
    print("isExists:: $hasExisted");
    if (!hasExisted) {
      print("create dis called");
      savedDir.create();
    }
  }

  Future<String?> _findLocalPath() async {
    if (platform == TargetPlatform.android) {
      return "/data/user/0/";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return directory.path + Platform.pathSeparator + 'Download';
    }
  }

  var id = "4";
  var url = "https://payday.api.php8.gainhq.com/api/payroll/payslip/pdf/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    _permissionReady = await _checkPermission();
                    if (_permissionReady) {
                      await _prepareSaveDir();
                      print("Downloading");
                      try {
                        final uri = Uri.parse("$url$id?download=true")
                            .replace(queryParameters: {'download': 'true'});
                        final response = await http.get(
                          uri,
                          headers: {
                            'Authorization':
                                'Bearer 1|RNfOpDsc31nlLnx4DZxdoZaTWtuj1G7LYHPQlf04'
                          },
                        );
                        final path = _localPath + "filename.pdf";
                        final bytes = response.bodyBytes;
                        final file = File(path);
                        await file.writeAsBytes(bytes);
                        print("Download Completed.");
                      } catch (e) {
                        print("Download Failed.\n\n" + e.toString());
                      }
                    }
                  },
                  child: Text("Click")),
            )
          ],
        ),
      ),
    );
  }
}
