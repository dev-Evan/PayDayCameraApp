import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/data/document_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/document_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class DocumentController extends GetxController with StateMixin {
  DocumentModel documentModel =DocumentModel();
  DocumentRepository documentRepository = DocumentRepository(NetworkClient());
  getDocumentData() async {
    change(null, status: RxStatus.loading());
    try {
      await documentRepository.getDocumentRepoData().then((value) {
        documentModel = value;
      }, onError: (error) {
        print(error.message);
      });
    } catch (ex) {
      print(ex.toString());
    }
    change(null, status: RxStatus.success());
  }
}