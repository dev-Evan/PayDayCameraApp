
class CheckEntryStatus {
  bool? status;
  String? message;
  Data? data;

  CheckEntryStatus({this.status, this.message, this.data});

  CheckEntryStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  bool? punchIn;
  List<BreakTimes>? breakTimes;
  BreakDetails? breakDetails;

  Data({this.punchIn, this.breakTimes, this.breakDetails});

  Data.fromJson(Map<String, dynamic> json) {
    punchIn = json['punch_in'];
    if (json['break_times'] != null) {
      breakTimes = <BreakTimes>[];
      json['break_times'].forEach((v) {
        breakTimes!.add(BreakTimes.fromJson(v));
      });
    }
    breakDetails = json['break_details'] != null
        ? BreakDetails.fromJson(json['break_details'])
        : null;
  }
}

class BreakTimes {
  int? id;
  String? name;
  String? duration;

  BreakTimes({this.id, this.name, this.duration});

  BreakTimes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
  }
}

class BreakDetails {
  int? id;
  int? attendanceId;
  int? breakTimeId;
  String? startAt;
  String? breakReason;
  String? duration;

  BreakDetails(
      {this.id,
      this.attendanceId,
      this.breakTimeId,
      this.startAt,
      this.breakReason,
      this.duration});

  BreakDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attendanceId = json['attendance_id'];
    breakTimeId = json['break_time_id'];
    startAt = json['start_at'];
    breakReason = json['break_reason'];
    duration = json['duration'];
  }
}
