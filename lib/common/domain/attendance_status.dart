class AttendanceStatus {
  bool? status;
  String? message;
  List<Data>? data;

  AttendanceStatus({this.status, this.message, this.data});

  AttendanceStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) { data!.add(Data.fromJson(v)); });
    }
  }

  @override
  String toString() {
    return 'AttendanceStatus{status: $status, message: $message, data: $data}';
  }
}

class Data {
  int? id;
  String? name;
  String? dataClass;
  String? type;
  String? translatedName;

  Data({this.id, this.name, this.dataClass, this.type, this.translatedName});

  Data.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  name = json['name'];
  dataClass = json['class'];
  type = json['type'];
  translatedName = json['translated_name'];
  }

  @override
  String toString() {
    return 'Data{id: $id, name: $name, dataClass: $dataClass, type: $type, translatedName: $translatedName}';
  }
}
