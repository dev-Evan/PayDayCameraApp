import 'package:get/get.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/modules/more/domain/deleted_document_model.dart';
import 'package:pay_day_mobile/modules/more/domain/document_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';

class DocumentRepository {
  final NetworkClient networkClient;
  DocumentRepository(this.networkClient);
  Future<DocumentModel> getDocumentRepoData() async {
    try {
      Response response = await networkClient.getRequest(
           Api.DOCUMENT_LIST, );
      print("Document list called :::: ${response.body}");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return DocumentModel.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }


  Future<DeletedDocModel> deletedDocRepo(
      String id,
      ) async {
    try {
      Response response = await networkClient.postRequest(
        Api.DELETED_DOCUMENT,
        {
          "id": id,
        },
      );
      print(response.body.toString());
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print("Deleted document ::: ${response.body}");

        return DeletedDocModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }


}
