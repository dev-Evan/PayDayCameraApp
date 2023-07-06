class LogSummaryOverview {
  bool? status;
  String? message;
  Data? data;

  LogSummaryOverview({this.status, this.message, this.data});

  LogSummaryOverview.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  QueryString? queryString;
  List<AttendanceDetails>? attendanceDetails;

  Data({this.queryString, this.attendanceDetails});

  Data.fromJson(Map<String, dynamic> json) {
    queryString = json['query_string'] != null
        ? QueryString.fromJson(json['query_string'])
        : null;
    if (json['attendance_details'] != null) {
      attendanceDetails = <AttendanceDetails>[];
      json['attendance_details'].forEach((v) {
        attendanceDetails!.add(AttendanceDetails.fromJson(v));
      });
    }
  }
}

class QueryString {
  String? start;
  String? end;

  QueryString({this.start, this.end});

  QueryString.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }
}

class AttendanceDetails {
  String? month;
  String? dateInNumber;
  dynamic scheduledHours;
  dynamic totalWorkingHours;
  dynamic paidLeaves;
  dynamic balance;
  dynamic breakTime;

  AttendanceDetails(
      {this.month,
      this.dateInNumber,
      this.scheduledHours,
      this.totalWorkingHours,
      this.paidLeaves,
      this.balance,
      this.breakTime});

  AttendanceDetails.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    dateInNumber = json['date_in_number'];
    scheduledHours = json['scheduled_hours'];
    totalWorkingHours = json['total_working_hours'];
    paidLeaves = json['paid_leaves'];
    balance = json['balance'];
    breakTime = json['break_times'];
  }
}
