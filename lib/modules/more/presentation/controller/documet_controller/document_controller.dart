import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/more/data/document_repository/document_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/document_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../../../common/widget/error_alert_pop_up.dart';
import '../logout_controller.dart';

class DocumentController extends GetxController with StateMixin {
  DocumentModel documentModel =DocumentModel();
  var newValue="";
  DocumentRepository documentRepository = DocumentRepository(NetworkClient());



  getDocumentData() async {
    change(null, status: RxStatus.loading());
    try {
      await documentRepository.getDocumentRepoData().then((value) {
        documentModel = value;
      }, onError: (error) {
        errorAlertPopup(getDocumentData);
        print( "Document Called ::: ${error.toString()}");
      });
    } catch (ex) {
      print("Document Called ex ::: ${ex.toString()}");
    }
    change(null, status: RxStatus.success());
  }



  void deletedDocumentApi() async {
    waitingLoader();
    try {
      await documentRepository
          .deletedDocRepo(
        GetStorage().read(AppString.STORE_DOC_Id).toString(),
      )
          .then((value) {
        Get.back();
        newValue="value";
        getDocumentData();
      }, onError: (error) {
        Get.back();
        print("Deleted document ::: $error");
      });
    } catch (ex) {
      print("Deleted document ::: $ex");
    }
    change(null, status: RxStatus.success());
  }



}





