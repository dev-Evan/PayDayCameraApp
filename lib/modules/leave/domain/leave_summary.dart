class LeaveSummary {
  bool? status;
  String? message;
  Data? data;

  LeaveSummary({this.status, this.message, this.data});

  LeaveSummary.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  String? available;
  String? upcoming;
  String? pending;
  String? approved;

  Data({this.available, this.upcoming, this.pending, this.approved});

  Data.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    upcoming = json['upcoming'];
    pending = json['pending'];
    approved = json['approved'];
  }

}
