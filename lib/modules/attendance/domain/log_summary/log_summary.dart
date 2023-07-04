class LogSummary {
  bool? status;
  String? message;
  Data? data;

  LogSummary({this.status, this.message, this.data});

  LogSummary.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? behavior;
  String? worked;
  String? scheduled;
  String? balance;
  String? paidLeave;
  String? availablity;

  Data(
      {this.behavior,
        this.worked,
        this.scheduled,
        this.balance,
        this.paidLeave,
        this.availablity});

  Data.fromJson(Map<String, dynamic> json) {
    behavior = json['behavior'];
    worked = json['worked'];
    scheduled = json['scheduled'];
    balance = json['balance'];
    paidLeave = json['paid_leave'];
    availablity = json['availablity'];
  }
}
