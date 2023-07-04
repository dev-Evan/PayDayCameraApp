class PayslipViewModel {
  bool? status;
  String? message;
  Data? data;

  PayslipViewModel({this.status, this.message, this.data});

  PayslipViewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Payslip? payslip;
  List<Allowances>? allowances;
  List<Deductions>? deductions;

  Data({this.payslip, this.allowances, this.deductions});

  Data.fromJson(Map<String, dynamic> json) {
    payslip =
    json['payslip'] != null ? new Payslip.fromJson(json['payslip']) : null;
    if (json['allowances'] != null) {
      allowances = <Allowances>[];
      json['allowances'].forEach((v) {
        allowances!.add(new Allowances.fromJson(v));
      });
    }
    if (json['deductions'] != null) {
      deductions = <Deductions>[];
      json['deductions'].forEach((v) {
        deductions!.add(new Deductions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payslip != null) {
      data['payslip'] = this.payslip!.toJson();
    }
    if (this.allowances != null) {
      data['allowances'] = this.allowances!.map((v) => v.toJson()).toList();
    }
    if (this.deductions != null) {
      data['deductions'] = this.deductions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Payslip {
  dynamic id;
  dynamic useId;
  String? payslipId;
  dynamic payrunId;
  dynamic tenantId;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? netSalary;
  String? basicSalary;
  String? period;
  dynamic considerOvertime;
  String? considerType;
  String? totalAllowance;
  String? totalDeduction;
  Status? status;

  Payslip(
      {this.id,
        this.useId,
        this.payslipId,
        this.payrunId,
        this.tenantId,
        this.startDate,
        this.endDate,
        this.createdAt,
        this.netSalary,
        this.basicSalary,
        this.period,
        this.considerOvertime,
        this.considerType,
        this.totalAllowance,
        this.totalDeduction,
        this.status});

  Payslip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    useId = json['use_id'];
    payslipId = json['payslip_id'];
    payrunId = json['payrun_id'];
    tenantId = json['tenant_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    netSalary = json['net_salary'];
    basicSalary = json['basic_salary'];
    period = json['period'];
    considerOvertime = json['consider_overtime'];
    considerType = json['consider_type'];
    totalAllowance = json['total_allowance'];
    totalDeduction = json['total_deduction'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['use_id'] = this.useId;
    data['payslip_id'] = this.payslipId;
    data['payrun_id'] = this.payrunId;
    data['tenant_id'] = this.tenantId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['created_at'] = this.createdAt;
    data['net_salary'] = this.netSalary;
    data['basic_salary'] = this.basicSalary;
    data['period'] = this.period;
    data['consider_overtime'] = this.considerOvertime;
    data['consider_type'] = this.considerType;
    data['total_allowance'] = this.totalAllowance;
    data['total_deduction'] = this.totalDeduction;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    return data;
  }
}

class Status {
  int? id;
  String? statusClass;
  String? statusName;
  String? type;

  Status({this.id, this.statusClass, this.statusName, this.type});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusClass = json['status_class'];
    statusName = json['status_name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status_class'] = this.statusClass;
    data['status_name'] = this.statusName;
    data['type'] = this.type;
    return data;
  }
}

class Allowances {
  String? name;
  String? type;
  dynamic value;
  dynamic isPercentage;
  String? amount;

  Allowances(
      {this.name, this.type, this.value, this.isPercentage, this.amount});

  Allowances.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    value = json['value'];
    isPercentage = json['is_percentage'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['value'] = this.value;
    data['is_percentage'] = this.isPercentage;
    data['amount'] = this.amount;
    return data;
  }
}


class Deductions {
  String? name;
  String? type;
  dynamic value;
  int? isPercentage;
  dynamic amount;

  Deductions(
      {this.name, this.type, this.value, this.isPercentage, this.amount});

  Deductions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    value = json['value'];
    isPercentage = json['is_percentage'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['value'] = this.value;
    data['is_percentage'] = this.isPercentage;
    data['amount'] = this.amount;
    return data;
  }
}

