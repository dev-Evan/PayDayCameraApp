class FilteredLogSummary {
  bool? status;
  String? message;
  Data? data;

  FilteredLogSummary({this.status, this.message, this.data});

  FilteredLogSummary.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  QueryString? queryString;
  List<LogData>? data;
  Links? links;
  Meta? meta;

  Data({this.queryString, this.data, this.links, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    queryString = json['query_string'] != null
        ? QueryString.fromJson(json['query_string'])
        : null;

    if (json['data'] != null) {
      data = <LogData>[];
      json['data'].forEach((v) {
        data!.add(LogData.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
}

class LogData {
  int? id;
  String? date;
  String? dateInNumber;
  String? month;
  int? userId;
  String? behavior;
  dynamic totalHours;
  int? totalComments;
  List<Details>? details;

  LogData(
      {this.id,
      this.date,
      this.dateInNumber,
      this.month,
      this.userId,
      this.behavior,
      this.totalHours,
      this.details,
      this.totalComments});

  LogData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateInNumber = json['date_in_number'];
    month = json['month'];
    userId = json['user_id'];
    behavior = json['behavior'];
    totalHours = json['total_hours'];
    totalComments = json['total_comments'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
  }
}

class Details {
  int? id;
  int? attendanceId;
  int? statusId;
  String? inTime;
  String? outTime;
  String? startTime;
  dynamic totalHours;
  InIpData? inIpData;
  InIpData? outIpData;
  String? statusName;
  String? statusClass;
  List<Comments>? comments;

  Details(
      {this.id,
      this.attendanceId,
      this.statusId,
      this.inTime,
      this.outTime,
      this.startTime,
      this.totalHours,
      this.inIpData,
      this.outIpData,
      this.statusName,
      this.statusClass,
      this.comments});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attendanceId = json['attendance_id'];
    statusId = json['status_id'];
    inTime = json['in_time'];
    outTime = json['out_time'];
    startTime = json['start_time'];
    totalHours = json['total_hours'];
    inIpData = json['in_ip_data'] != null
        ? InIpData.fromJson(json['in_ip_data'])
        : null;
    outIpData = json['out_ip_data'] != null
        ? InIpData.fromJson(json['out_ip_data'])
        : null;
    statusName = json['status_name'];
    statusClass = json['status_class'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
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

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }
}

class Meta {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Meta(
      {this.total,
      this.count,
      this.perPage,
      this.currentPage,
      this.totalPages});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
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
