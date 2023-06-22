class SalaryOverViewModel {
  bool? status;
  String? message;
  List<Data>? data;

  SalaryOverViewModel({this.status, this.message, this.data});

  SalaryOverViewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  bool? basicSalary;
  String? level;
  String? message;
  String? amount;

  Data({this.basicSalary, this.level, this.message, this.amount});

  Data.fromJson(Map<String, dynamic> json) {
    basicSalary = json['basic_salary'];
    level = json['level'];
    message = json['message'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['basic_salary'] = basicSalary;
    data['level'] = level;
    data['message'] = message;
    data['amount'] = amount;
    return data;
  }
}