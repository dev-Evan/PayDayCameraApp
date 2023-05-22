class SummaryModel {
  bool? status;
  String? message;
  Data? data;

  SummaryModel({this.status, this.message, this.data});

  SummaryModel.fromJson(Map<String, dynamic> json) {
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
  Summary? summary;

  Data({this.summary});

  Data.fromJson(Map<String, dynamic> json) {
    summary =
    json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class Summary {
  int? total;
  int? paid;
  int? unpaid;

  Summary({this.total, this.paid, this.unpaid});

  Summary.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    paid = json['paid'];
    unpaid = json['unpaid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['paid'] = this.paid;
    data['unpaid'] = this.unpaid;
    return data;
  }
}
