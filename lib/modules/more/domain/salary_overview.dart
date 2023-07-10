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
  String? addedBy;
  bool? increment;
  String? level;
  String? effectiveDate;
  String? createdDate;
  bool? basicSalary;
  String? amount;
  String? previousSalary;
  String? currentSalary;
  String? message;

  Data(
      {this.addedBy,
        this.increment,
        this.level,
        this.effectiveDate,
        this.createdDate,
        this.basicSalary,
        this.amount,
        this.previousSalary,
        this.currentSalary,
        this.message});

  Data.fromJson(Map<String, dynamic> json) {
    addedBy = json['added_by'];
    increment = json['increment'];
    level = json['level'];
    effectiveDate = json['effective_date'];
    createdDate = json['created_date'];
    basicSalary = json['basic_salary'];
    amount = json['amount'];
    previousSalary = json['previous_salary'];
    currentSalary = json['current_salary'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['added_by'] = this.addedBy;
    data['increment'] = this.increment;
    data['level'] = this.level;
    data['effective_date'] = this.effectiveDate;
    data['created_date'] = this.createdDate;
    data['basic_salary'] = this.basicSalary;
    data['amount'] = this.amount;
    data['previous_salary'] = this.previousSalary;
    data['current_salary'] = this.currentSalary;
    data['message'] = this.message;
    return data;
  }
}
