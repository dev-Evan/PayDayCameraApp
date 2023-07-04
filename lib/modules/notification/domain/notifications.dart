class Notifications {
  bool? status;
  String? message;
  Data? data;

  Notifications({this.status, this.message, this.data});

  Notifications.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<NotificationData>? data;
  Links? links;
  Meta? meta;

  Data({this.data, this.links, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NotificationData>[];
      json['data'].forEach((v) {
        data!.add(NotificationData.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

}

class NotificationData {
  String? id;
  int? notifierId;
  String? name;
  String? url;
  String? title;
  bool? read;
  String? date;
  String? time;

  NotificationData(
      {this.id,
        this.notifierId,
        this.name,
        this.url,
        this.title,
        this.read,
        this.date,
        this.time});

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notifierId = json['notifier_id'];
    name = json['name'];
    url = json['url'];
    title = json['title'];
    read = json['read'];
    date = json['date'];
    time = json['time'];
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
