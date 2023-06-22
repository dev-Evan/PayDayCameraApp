class PayslipViewModel {
  bool? status;
  String? message;
  Data? data;

  PayslipViewModel({this.status, this.message, this.data});

  PayslipViewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
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
    json['payslip'] != null ? Payslip.fromJson(json['payslip']) : null;
    if (json['allowances'] != null) {
      allowances = <Allowances>[];
      json['allowances'].forEach((v) {
        allowances!.add(Allowances.fromJson(v));
      });
    }
    if (json['deductions'] != null) {
      deductions = <Deductions>[];
      json['deductions'].forEach((v) {
        deductions!.add(Deductions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (payslip != null) {
      data['payslip'] = payslip!.toJson();
    }
    if (allowances != null) {
      data['allowances'] = allowances!.map((v) => v.toJson()).toList();
    }
    if (deductions != null) {
      data['deductions'] = deductions!.map((v) => v.toJson()).toList();
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
    json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['use_id'] = useId;
    data['payslip_id'] = payslipId;
    data['payrun_id'] = payrunId;
    data['tenant_id'] = tenantId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['created_at'] = createdAt;
    data['net_salary'] = netSalary;
    data['basic_salary'] = basicSalary;
    data['period'] = period;
    data['consider_overtime'] = considerOvertime;
    data['consider_type'] = considerType;
    data['total_allowance'] = totalAllowance;
    data['total_deduction'] = totalDeduction;
    if (status != null) {
      data['status'] = status!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status_class'] = statusClass;
    data['status_name'] = statusName;
    data['type'] = type;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['value'] = value;
    data['is_percentage'] = isPercentage;
    data['amount'] = amount;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['value'] = value;
    data['is_percentage'] = isPercentage;
    data['amount'] = amount;
    return data;
  }
}

