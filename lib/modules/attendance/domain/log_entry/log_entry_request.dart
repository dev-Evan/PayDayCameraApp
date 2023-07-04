class LogEntryRequest {
  IpData? _ipData;
  String? _today;
  String? _note;

  LogEntryRequest({IpData? ipData, String? today, String? note}) {
    if (ipData != null) {
      _ipData = ipData;
    }
    if (today != null) {
      _today = today;
    }
    if (note != null) {
      _note = note;
    }
  }

  set ipData(IpData? ipData) => _ipData = ipData;

  set today(String? today) => _today = today;

  set note(String? note) => _note = note;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_ipData != null) {
      data['ip_data'] = _ipData!.toJson();
    }
    data['today'] = _today;
    data['note'] = _note;
    return data;
  }
}

class IpData {
  String? _ip;
  Coordinate? _coordinate;
  String? _location;
  bool? _workFromHome;

  IpData(
      {String? ip,
      Coordinate? coordinate,
      String? location,
      bool? workFromHome}) {
    if (ip != null) {
      _ip = ip;
    }
    if (coordinate != null) {
      _coordinate = coordinate;
    }
    if (location != null) {
      _location = location;
    }
    if (workFromHome != null) {
      _workFromHome = workFromHome;
    }
  }

  set ip(String? ip) => _ip = ip;

  set coordinate(Coordinate? coordinate) => _coordinate = coordinate;

  set location(String? location) => _location = location;

  set workFromHome(bool? workFromHome) => _workFromHome = workFromHome;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ip'] = _ip;
    if (_coordinate != null) {
      data['coordinate'] = _coordinate!.toJson();
    }
    data['location'] = _location;
    data['work_from_home'] = _workFromHome;
    return data;
  }
}

class Coordinate {
  String? _lat;
  String? _lng;

  Coordinate({String? lat, String? lng}) {
    if (lat != null) {
      _lat = lat;
    }
    if (lng != null) {
     _lng = lng;
    }
  }

  set lat(String? lat) => _lat = lat;

  set lng(String? lng) => _lng = lng;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = _lat;
    data['lng'] = _lng;
    return data;
  }
}
