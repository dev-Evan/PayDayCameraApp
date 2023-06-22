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
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['branch_name'] = branchName;
    data['account_title'] = accountTitle;
    data['account_holder_name'] = accountHolderName;
    data['account_number'] = accountNumber;
    data['tax_payer_id'] = taxPayerId;
    return data;
  }
}
