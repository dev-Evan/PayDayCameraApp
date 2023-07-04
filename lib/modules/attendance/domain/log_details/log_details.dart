class LogDetails {
  bool? status;
  String? message;
  Data? data;

  LogDetails({this.status, this.message, this.data});

  LogDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  int? id;
  String? inTime;
  String? outTime;
  int? attendanceId;
  InIpData? inIpData;
  InIpData? outIpData;
  int? statusId;
  int? reviewBy;
  int? addedBy;
  int? attendanceDetailsId;
  String? createdAt;
  String? updatedAt;
  List<Comments>? comments;
  String? behavior;
  String? inDate;
  dynamic totalHours;
  String? punchInStatus;
  String? logDate;
  String? logTime;
  dynamic parentAttendanceDetails;
  String? checkInTime;
  String? checkOutTime;

  Data(
      {this.id,
        this.inTime,
        this.outTime,
        this.attendanceId,
        this.inIpData,
        this.outIpData,
        this.statusId,
        this.reviewBy,
        this.addedBy,
        this.attendanceDetailsId,
        this.createdAt,
        this.updatedAt,
        this.comments,
        this.behavior,
        this.inDate,
        this.totalHours,
        this.punchInStatus,
        this.logDate,
        this.logTime,
        this.parentAttendanceDetails,
      this.checkInTime,
      this.checkOutTime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inTime = json['in_time'];
    outTime = json['out_time'];
    attendanceId = json['attendance_id'];
    inIpData = json['in_ip_data'] != null
        ? new InIpData.fromJson(json['in_ip_data'])
        : null;
    outIpData = json['out_ip_data'] != null
        ? new InIpData.fromJson(json['out_ip_data'])
        : null;
    statusId = json['status_id'];
    reviewBy = json['review_by'];
    addedBy = json['added_by'];
    attendanceDetailsId = json['attendance_details_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    behavior = json['behavior'];
    inDate = json['in_date'];
    totalHours = json['total_hours'];
    punchInStatus = json['punch_in_status'];
    logDate = json['log_date'];
    logTime = json['log_time'];
    parentAttendanceDetails = json['parent_attendance_details'];
    checkInTime = json['check_in_time'];
    checkOutTime = json['check_out_time'];
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

class Comments {
  int? id;
  int? userId;
  String? type;
  String? comment;

  Comments({this.id, this.userId, this.type, this.comment});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    comment = json['comment'];
  }


}