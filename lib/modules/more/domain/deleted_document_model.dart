class DeletedDocModel {
  bool? status;
  String? message;


  DeletedDocModel({this.status, this.message, });

  DeletedDocModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {

    }
  }

}
