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

  @override
  String toString() {
    return 'DailyLog{status: $status, message: $message, data: $data}';
  }
}

class Data {
  dynamic totalScheduled;
  dynamic todayScheduled;
  dynamic totalWorked;
  dynamic todayWorked;
  dynamic todayShortage;
  dynamic todayOvertime;
  dynamic totalShortage;
  dynamic totalOverTime;
  String? behavior;
  List<DailyLogs>? dailyLogs;


  @override
  String toString() {
    return 'Data{totalScheduled: $totalScheduled, todayScheduled: $todayScheduled, totalWorked: $totalWorked, todayWorked: $todayWorked, todayShortage: $todayShortage, todayOvertime: $todayOvertime, totalShortage: $totalShortage, totalOverTime: $totalOverTime, behavior: $behavior, dailyLogs: $dailyLogs}';
  }

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
  String? inIpData;
  String? outIpData;
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

  @override
  String toString() {
    return 'DailyLogs{id: $id, attendanceId: $attendanceId, startTime: $startTime, inTime: $inTime, outTime: $outTime, totalHours: $totalHours, inIpData: $inIpData, outIpData: $outIpData, notes: $notes}';
  }

  DailyLogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attendanceId = json['attendance_id'];
    startTime = json['start_time'];
    inTime = json['in_time'];
    outTime = json['out_time'];
    totalHours = json['total_hours'];
    inIpData = json['in_ip_data'];
    outIpData = json['out_ip_data'];
    if (json['notes'] != null) {
      notes = <Notes>[];
      json['notes'].forEach((v) {
        notes!.add(Notes.fromJson(v));
      });
    }
  }
}

class Notes {
  int? id;
  String? type;
  String? comment;

  Notes({this.id, this.type, this.comment});

  @override
  String toString() {
    return 'Notes{id: $id, type: $type, comment: $comment}';
  }

  Notes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    comment = json['comment'];
  }
}
