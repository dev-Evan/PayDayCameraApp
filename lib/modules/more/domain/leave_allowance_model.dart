class LeaveAllowanceDetailsModel {
  bool? status;
  String? message;
  List<LeaveAllowanceElement>? data;

  LeaveAllowanceDetailsModel({this.status, this.message, this.data});

  LeaveAllowanceDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LeaveAllowanceElement>[];
      json['data'].forEach((v) {
        data!.add(new LeaveAllowanceElement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LeaveAllowanceElement {
  String? type;
  String? leaveType;
  dynamic allowance;
  dynamic earned;
  dynamic taken;
  dynamic availability;

  LeaveAllowanceElement(
      {this.type,
        this.leaveType,
        this.allowance,
        this.earned,
        this.taken,
        this.availability});

  LeaveAllowanceElement.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    leaveType = json['leave_type'];
    allowance = json['allowance'];
    earned = json['earned'];
    taken = json['taken'];
    availability = json['availability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['leave_type'] = this.leaveType;
    data['allowance'] = this.allowance;
    data['earned'] = this.earned;
    data['taken'] = this.taken;
    data['availability'] = this.availability;
    return data;
  }
}
