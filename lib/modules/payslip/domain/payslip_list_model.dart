
import 'dart:convert';

PayslipListModel payslipListModelFromJson(String str) => PayslipListModel.fromJson(json.decode(str));

String payslipListModelToJson(PayslipListModel data) => json.encode(data.toJson());

class PayslipListModel {
  bool? status;
  String? message;
  Data? data;

  PayslipListModel({
    this.status,
    this.message,
    this.data,
  });

  factory PayslipListModel.fromJson(Map<String, dynamic> json) => PayslipListModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<Payslip>? payslips;
  Links? links;
  Meta? meta;

  Data({
    this.payslips,
    this.links,
    this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    payslips: json["payslips"] == null ? [] : List<Payslip>.from(json["payslips"]!.map((x) => Payslip.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "payslips": payslips == null ? [] : List<dynamic>.from(payslips!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}

class Links {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Meta({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    total: json["total"],
    count: json["count"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "total_pages": totalPages,
  };
}

class Payslip {
  int? id;
  int? userId;
  int? payrunId;
  String? dateInNumber;
  String? month;
  String? startDate;
  String? endDate;
  double? netSalary;
  int? basicSalary;
  String? period;
  int? considerOvertime;
  String? considerType;
  int? withoutBeneficiary;
  int? conflicted;
  String? statusName;
  String? statusClass;

  Payslip({
    this.id,
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
    this.statusClass,
  });

  factory Payslip.fromJson(Map<String, dynamic> json) => Payslip(
    id: json["id"],
    userId: json["user_id"],
    payrunId: json["payrun_id"],
    dateInNumber: json["date_in_number"],
    month: json["month"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    netSalary: json["net_salary"]?.toDouble(),
    basicSalary: json["basic_salary"],
    period: json["period"],
    considerOvertime: json["consider_overtime"],
    considerType: json["consider_type"],
    withoutBeneficiary: json["without_beneficiary"],
    conflicted: json["conflicted"],
    statusName: json["status_name"],
    statusClass: json["status_class"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "payrun_id": payrunId,
    "date_in_number": dateInNumber,
    "month": month,
    "start_date": startDate,
    "end_date": endDate,
    "net_salary": netSalary,
    "basic_salary": basicSalary,
    "period": period,
    "consider_overtime": considerOvertime,
    "consider_type": considerType,
    "without_beneficiary": withoutBeneficiary,
    "conflicted": conflicted,
    "status_name": statusName,
    "status_class": statusClass,
  };
}
