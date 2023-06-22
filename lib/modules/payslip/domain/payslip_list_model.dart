class PayslipListModel {
  bool? status;
  String? message;
  Data? data;

  PayslipListModel({this.status, this.message, this.data});

  PayslipListModel.fromJson(Map<String, dynamic> json) {
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
  List<Payslips>? payslips;
  Links? links;
  Meta? meta;

  Data({this.payslips, this.links, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['payslips'] != null) {
      payslips = <Payslips>[];
      json['payslips'].forEach((v) {
        payslips!.add(Payslips.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (payslips != null) {
      data['payslips'] = payslips!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Payslips {
  int? id;
  int? userId;
  int? payrunId;
  String? dateInNumber;
  String? month;
  String? startDate;
  String? endDate;
  String? netSalary;
  String? basicSalary;
  String? period;
  int? considerOvertime;
  String? considerType;
  int? withoutBeneficiary;
  int? conflicted;
  String? statusName;
  String? statusClass;

  Payslips(
      {this.id,
        this.userId,
        this.payrunId,
        this.dateInNumber,
        this.month,
        this.startDate,
        this.endDate,
        this.netSalary,
        this.basicSalary,
        this.period,
        this.considerOvertime,
        this.considerType,
        this.withoutBeneficiary,
        this.conflicted,
        this.statusName,
        this.statusClass});

  Payslips.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    payrunId = json['payrun_id'];
    dateInNumber = json['date_in_number'];
    month = json['month'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    netSalary = json['net_salary'];
    basicSalary = json['basic_salary'];
    period = json['period'];
    considerOvertime = json['consider_overtime'];
    considerType = json['consider_type'];
    withoutBeneficiary = json['without_beneficiary'];
    conflicted = json['conflicted'];
    statusName = json['status_name'];
    statusClass = json['status_class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['payrun_id'] = payrunId;
    data['date_in_number'] = dateInNumber;
    data['month'] = month;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['net_salary'] = netSalary;
    data['basic_salary'] = basicSalary;
    data['period'] = period;
    data['consider_overtime'] = considerOvertime;
    data['consider_type'] = considerType;
    data['without_beneficiary'] = withoutBeneficiary;
    data['conflicted'] = conflicted;
    data['status_name'] = statusName;
    data['status_class'] = statusClass;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Meta(
      {this.total,
        this.count,
        this.perPage,
        this.currentPage,
        this.totalPages});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['count'] = count;
    data['per_page'] = perPage;
    data['current_page'] = currentPage;
    data['total_pages'] = totalPages;
    return data;
  }
}
