class LeaveAllowance {
  bool? status;
  String? message;
  Data? data;

  LeaveAllowance({this.status, this.message, this.data});

  LeaveAllowance.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  Casual? casual;
  Casual? sick;

  Data({this.casual, this.sick});

  Data.fromJson(Map<String, dynamic> json) {
    casual = json['casual'] != null ? Casual.fromJson(json['casual']) : null;
    sick = json['sick'] != null ? Casual.fromJson(json['sick']) : null;
  }
}

class Casual {
  Paid? paid;
  Paid? unpaid;

  Casual({this.paid, this.unpaid});

  Casual.fromJson(Map<String, dynamic> json) {
    paid = json['paid'] != null ? Paid.fromJson(json['paid']) : null;
    unpaid = json['unpaid'] != null ? Paid.fromJson(json['unpaid']) : null;
  }
}

class Paid {
  String? allowance;
  String? earned;
  String? taken;
  String? availability;

  Paid({this.allowance, this.earned, this.taken, this.availability});

  Paid.fromJson(Map<String, dynamic> json) {
    allowance = json['allowance'];
    earned = json['earned'];
    taken = json['taken'];
    availability = json['availability'];
  }
}
