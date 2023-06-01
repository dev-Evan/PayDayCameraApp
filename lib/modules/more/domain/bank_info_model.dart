class BankInfoModel {
  bool? status;

  @override
  String toString() {
    return 'BankInfoModel{status: $status, message: $message, data: $data}';
  }

  String? message;
  Data? data;

  BankInfoModel({this.status, this.message, this.data});

  BankInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  dynamic id;
  String? name;

  @override
  String toString() {
    return 'Data{id: $id, name: $name, code: $code, branchName: $branchName, accountTitle: $accountTitle, accountHolderName: $accountHolderName, accountNumber: $accountNumber, taxPayerId: $taxPayerId}';
  }

  String? code;
  String? branchName;
  String? accountTitle;
  String? accountHolderName;
  String? accountNumber;
  String? taxPayerId;

  Data(
      {this.id,
        this.name,
        this.code,
        this.branchName,
        this.accountTitle,
        this.accountHolderName,
        this.accountNumber,
        this.taxPayerId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    branchName = json['branch_name'];
    accountTitle = json['account_title'];
    accountHolderName = json['account_holder_name'];
    accountNumber = json['account_number'];
    taxPayerId = json['tax_payer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['branch_name'] = this.branchName;
    data['account_title'] = this.accountTitle;
    data['account_holder_name'] = this.accountHolderName;
    data['account_number'] = this.accountNumber;
    data['tax_payer_id'] = this.taxPayerId;
    return data;
  }
}
