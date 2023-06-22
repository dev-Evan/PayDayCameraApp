class SummaryModel {
  bool? status;
  String? message;
  Data? data;

  SummaryModel({this.status, this.message, this.data});

  SummaryModel.fromJson(Map<String, dynamic> json) {
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
  Summary? summary;

  Data({this.summary});

  Data.fromJson(Map<String, dynamic> json) {
    summary =
    json['summary'] != null ? Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (summary != null) {
      data['summary'] = summary!.toJson();
    }
    return data;
  }
}

class Summary {
  int? total;
  int? sent;
  int? conflicted;

  Summary({this.total, this.sent, this.conflicted});

  Summary.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    sent = json['sent'];
    conflicted = json['conflicted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['sent'] = sent;
    data['conflicted'] = conflicted;
    return data;
  }
}
