import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/controller/api_check_controller.dart';
import 'package:pay_day_mobile/modules/more/data/document_repository/document_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/document_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class DocumentController extends GetxController with StateMixin {
  final isLoading = false.obs;
  DocumentModel documentModel =DocumentModel();
  DocumentRepository documentRepository = DocumentRepository(NetworkClient());

  getDocumentData() async {
    change(null, status: RxStatus.loading());
    try {
      await documentRepository.getDocumentRepoData().then((value) {
        documentModel = value;
      }, onError: (error) {
        CheckForApi().checkForApi(error);
        print( "Document Called ::: ${error.toString()}");
      });
    } catch (ex) {
      print("Document Called ex ::: ${ex.toString()}");
    }
    change(null, status: RxStatus.success());
  }


   deletedDocumentApi() async {
     bool isReturnValue = false;
     isLoading(true);
      await documentRepository.deletedDocRepo(GetStorage().read(AppString.STORE_DOC_Id).toString()).then((value) {
        isLoading(false);
        isReturnValue=true;

      }, onError: (error) {
        isLoading(false);
        isReturnValue=false;
        print("Deleted document ::: $error");
      });
    isLoading(false);
    return isReturnValue;
  }

  Future<void> _refreshPage() async{
    await getDocumentData();
  }

}





