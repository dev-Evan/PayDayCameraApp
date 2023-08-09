import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/utils/exception_handler.dart';
import 'package:pay_day_mobile/modules/more/data/document_repository/document_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/document_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/logger.dart';

class DocumentController extends GetxController with StateMixin {
  final isLoading = false.obs;
  DocumentModel documentModel = DocumentModel();
  DocumentRepository documentRepository = DocumentRepository(NetworkClient());

  //get document index here
  getDocumentIndex() async {
    change(null, status: RxStatus.loading());
    await documentRepository.getDocumentRepoData().then((value) {
      documentModel = value;
    }, onError: (error) {
      errorChecker(error.message);
      LoggerHelper.errorLog(message: error.message);
    });
    change(null, status: RxStatus.success());
  }

// delete document index here
  deletedDocumentIndex() async {
    bool isReturnValue = false;
    isLoading(true);
    await documentRepository.deletedDocRepo(GetStorage().read(AppString.STORE_DOC_Id).toString()).then((value) {
      isLoading(false);
      isReturnValue = true;
    }, onError: (error) {
      isLoading(false);
      isReturnValue = false;
      LoggerHelper.errorLog(message: error.message);
    });
    isLoading(false);
    return isReturnValue;
  }
}
