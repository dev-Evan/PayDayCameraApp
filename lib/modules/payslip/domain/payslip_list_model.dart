class PayslipListModel {
  bool? status;
  String? message;
  Data? data;

  PayslipListModel({this.status, this.message, this.data});

  PayslipListModel.fromJson(Map<String, dynamic> json) {
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
  List<Payslips>? payslips;
  Links? links;
  Meta? meta;

  Data({this.payslips, this.links, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['payslips'] != null) {
      payslips = <Payslips>[];
      json['payslips'].forEach((v) {
        payslips!.add(new Payslips.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payslips != null) {
      data['payslips'] = this.payslips!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['payrun_id'] = this.payrunId;
    data['date_in_number'] = this.dateInNumber;
    data['month'] = this.month;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['net_salary'] = this.netSalary;
    data['basic_salary'] = this.basicSalary;
    data['period'] = this.period;
    data['consider_overtime'] = this.considerOvertime;
    data['consider_type'] = this.considerType;
    data['without_beneficiary'] = this.withoutBeneficiary;
    data['conflicted'] = this.conflicted;
    data['status_name'] = this.statusName;
    data['status_class'] = this.statusClass;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  Null? prev;
  Null? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    return data;
  }
}
