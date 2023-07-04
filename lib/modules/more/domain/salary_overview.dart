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
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['basic_salary'] = this.basicSalary;
    data['level'] = this.level;
    data['message'] = this.message;
    data['amount'] = this.amount;
    return data;
  }
}