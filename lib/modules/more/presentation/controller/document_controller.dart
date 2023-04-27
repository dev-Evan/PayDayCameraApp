import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/more/data/document_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/document_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class DocumentController extends GetxController with StateMixin {
  DocumentModel? documentModel;
  final _box = GetStorage();
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
        var id = documentModel?.data?.documents?.first.id.toString();
        _box.write(AppString.STORE_DOC_USER_ID, id);
      }, onError: (error) {
        print(error.message);
      });
    } catch (ex) {
      print(ex.toString());
    }
    change(null, status: RxStatus.success());
  }
}
