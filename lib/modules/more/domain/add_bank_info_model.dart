class AddBankInfoModel {
  bool? status;
  String? message;
  List<void>? data;

  AddBankInfoModel({this.status, this.message, this.data});

  AddBankInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
