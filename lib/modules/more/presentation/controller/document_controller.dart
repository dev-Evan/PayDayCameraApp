import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pay_day_mobile/modules/more/data/document_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/document_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class DocumentController extends GetxController with StateMixin {
  DocumentModel? documentModel;
  @override
  void onInit() {
    getDocumentData();
    super.onInit();
  }
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