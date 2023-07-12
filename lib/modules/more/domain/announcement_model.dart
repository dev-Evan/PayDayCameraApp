class AnnouncementModel {
  bool? status;
  String? message;
  Data? data;

  AnnouncementModel({this.status, this.message, this.data});

  AnnouncementModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Announcements>? announcements;
  Links? links;
  Meta? meta;

  Data({this.announcements, this.links, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['announcements'] != null) {
      announcements = <Announcements>[];
      json['announcements'].forEach((v) {
        announcements!.add(new Announcements.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.announcements != null) {
      data['announcements'] =
          this.announcements!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Announcements {
  int? id;
  String? name;
  String? description;
  String? startDate;
  String? endDate;

  Announcements(
      {this.id, this.name, this.description, this.startDate, this.endDate});

  Announcements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  dynamic prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    return data;
  }
}
