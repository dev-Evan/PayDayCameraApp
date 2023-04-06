class DailyLog {
  bool? status;
  String? message;
  Data? data;

  DailyLog({this.status, this.message, this.data});

  DailyLog.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  dynamic totalScheduled;
  dynamic todayScheduled;
  dynamic totalWorked;
  dynamic todayWorked;
  dynamic todayShortage;
  dynamic todayOvertime;
  double? totalShortage;
  int? totalOverTime;
  String? behavior;
  List<DailyLogs>? dailyLogs;

  Data(
      {this.totalScheduled,
      this.todayScheduled,
      this.totalWorked,
      this.todayWorked,
      this.todayShortage,
      this.todayOvertime,
      this.totalShortage,
      this.totalOverTime,
      this.behavior,
      this.dailyLogs});

  Data.fromJson(Map<String, dynamic> json) {
    totalScheduled = json['total_scheduled'];
    todayScheduled = json['today_scheduled'];
    totalWorked = json['total_worked'];
    todayWorked = json['today_worked'];
    todayShortage = json['today_shortage'];
    todayOvertime = json['today_overtime'];
    totalShortage = json['total_shortage'];
    totalOverTime = json['total_over_time'];
    behavior = json['behavior'];
    if (json['daily_logs'] != null) {
      dailyLogs = <DailyLogs>[];
      json['daily_logs'].forEach((v) {
        dailyLogs!.add(DailyLogs.fromJson(v));
      });
    }
  }
}

class DailyLogs {
  int? id;
  int? attendanceId;
  String? startTime;
  String? inTime;
  String? outTime;
  dynamic totalHours;
  InIpData? inIpData;
  InIpData? outIpData;
  List<Notes>? notes;

  DailyLogs(
      {this.id,
      this.attendanceId,
      this.startTime,
      this.inTime,
      this.outTime,
      this.totalHours,
      this.inIpData,
      this.outIpData,
      this.notes});

  DailyLogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attendanceId = json['attendance_id'];
    startTime = json['start_time'];
    inTime = json['in_time'];
    outTime = json['out_time'];
    totalHours = json['total_hours'];
    inIpData = json['in_ip_data'] != null
        ? InIpData.fromJson(json['in_ip_data'])
        : null;
    outIpData = json['out_ip_data'] != null
        ? InIpData.fromJson(json['out_ip_data'])
        : null;
    if (json['notes'] != null) {
      notes = <Notes>[];
      json['notes'].forEach((v) {
        notes!.add(Notes.fromJson(v));
      });
    }
  }
}

class InIpData {
  String? ip;
  Coordinate? coordinate;
  String? location;
  bool? workFromHome;

  InIpData({this.ip, this.coordinate, this.location, this.workFromHome});

  InIpData.fromJson(Map<String, dynamic> json) {
    ip = json['ip'];
    coordinate = json['coordinate'] != null
        ? Coordinate.fromJson(json['coordinate'])
        : null;
    location = json['location'];
    workFromHome = json['work_from_home'];
  }
}

class Coordinate {
  String? lat;
  String? lng;

  Coordinate({this.lat, this.lng});

  Coordinate.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }
}

class Notes {
  int? id;
  String? type;
  String? comment;

  Notes({this.id, this.type, this.comment});

  Notes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    comment = json['comment'];
  }
}
