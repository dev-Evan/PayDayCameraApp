
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pay_day_mobile/network/network_client.dart';

import '../../../../utils/app_string.dart';
class PayslipDownlaodController extends GetxController{
  final url = 'https://payday.php8.gainhq.com/api/payroll/payslip/pdf/21';
  final storage = GetStorage();
  var isLoading = false.obs;
  Future<void> downloadPdf() async {

    final uri = Uri.parse(url).replace(queryParameters: {'download':'true'});
    final response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer 8|Y6qza0bb70hW67Mrh58m1SdUCU0HxXnYpKYlYuRL'},
    );

    final bytes = response.bodyBytes;
    final directory = (await getExternalStorageDirectories(type: StorageDirectory.documents))?.first;
    const path = '/storage/emulated/0/Download/fileName13.pdf';
    final file = File(path);
    await file.writeAsBytes(bytes);


  }






















  // Future<File> downloadPDF() async {
  //   final url = 'https://payday.php8.gainhq.com/api/payroll/payslip/pdf/21';
  //
  //   final uri = Uri.parse(url).replace(queryParameters: {'download':'true'});
  //   final response = await http.get(
  //     uri,
  //     headers: {'Authorization': 'Bearer 8|Y6qza0bb70hW67Mrh58m1SdUCU0HxXnYpKYlYuRL'},
  //   );
  //
  //   final bytes = response.bodyBytes;
  //
  //   const path = '/storage/emulated/0/Download/fileName.pdf';
  //   final file = File(path);
  //   await file.writeAsBytes(bytes);
  //
  //   // final documentDirectory = await getApplicationDocumentsDirectory();
  //   // const path = '/storage/emulated/0/Download/fileName.pdf';
  //   // final file = File(path);
  //   await file.writeAsBytes(response.bodyBytes);
  //
  //   if(response.statusCode==200){
  //     print("ok");
  //     print(file.toString());
  //     print(response.toString());
  //     print(file.path.toString());
  //   }
  //
  //
  //
  //   final raf=file.openSync(mode: FileMode.write);
  //   raf.writeFromSync(response.bodyBytes);
  //   await raf.close();
  //
  //
  //   return file;
  //
  //
  //
  //
  //
  // }

  // Future openFile({required String url,String ? fileName})async{
  //   final file = await downloadFile();
  // }


}










