// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
//
// class PdfDownloader extends StatefulWidget {
//   final String url;
//
//   const PdfDownloader({Key? key, required this.url}) : super(key: key);
//
//   @override
//   _PdfDownloaderState createState() => _PdfDownloaderState();
// }
//
// class _PdfDownloaderState extends State<PdfDownloader> {
//   bool downloading = false;
//   String? progressMessage;
//
//   Future<void> downloadPdf() async {
//     setState(() {
//       downloading = true;
//     });
//
//    // final response = await http.get(Uri.parse(widget.url));
//
//     final uri = Uri.parse(widget.url).replace(queryParameters: {'download':'true'});
//     final response = await http.get(
//       uri,
//       headers: {'Authorization': 'Bearer 8|Y6qza0bb70hW67Mrh58m1SdUCU0HxXnYpKYlYuRL'},
//     );
//
//
//
//
//
//
//
//
//
//     final bytes = response.bodyBytes;
//
//     final directory = await getExternalStorageDirectory();
//     final path = '${directory!.path}/my3_pdf_file.pdf';

//     final file = File(path);
//
//     await file.writeAsBytes(bytes);
//
//     setState(() {
//       downloading = false;
//       progressMessage = 'PDF file downloaded to $path';
//       print(path.toString());
//       print(response.statusCode);
//       print(response.toString());
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Downloader'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (downloading)
//               CircularProgressIndicator()
//             else
//               ElevatedButton(
//                 onPressed: downloadPdf,
//                 child: Text('Download PDF'),
//               ),
//             if (progressMessage != null) Text(progressMessage!),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfDownloader extends StatefulWidget {
  final String url;

  const PdfDownloader({Key? key, required this.url}) : super(key: key);

  @override
  _PdfDownloaderState createState() => _PdfDownloaderState();
}

class _PdfDownloaderState extends State<PdfDownloader> {
  bool downloading = false;
  String? progressMessage;

  Future<void> downloadPdf() async {
    setState(() {
      downloading = true;
    });

    final uri = Uri.parse(widget.url).replace(queryParameters: {'download':'true'});
    final response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer 3|d15hVRYtpLo1DqWTKyoAJXw5Iwv3ExJf0rDxNQ34'},
    );

    final bytes = response.bodyBytes;
   final path = '/storage/emulated/0/Download/fileName6667.pdf';
    final file = File(path);
    await file.writeAsBytes(bytes);

    setState(() {
      downloading = false;
      progressMessage = 'PDF file downloaded to $path';
      print(path.toString());
      print(response.statusCode);
      print(response.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Downloader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (downloading)
              CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: downloadPdf,
                child: Text('Download PDF'),
              ),
            if (progressMessage != null) Text(progressMessage!),
          ],
        ),
      ),
    );
  }
}
