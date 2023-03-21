class ChangeRequestReqModel {
  String? _inTime;
  String? _outTime;
  String? _note;
  String? _inIpData;
  String? _outIpData;

  ChangeRequestReqModel(
      { String? inTime,
        String? outTime,
        String? note,
        String? inIpData,
        String? outIpData}) {
    if (inTime != null) {
      _inTime = inTime;
    }
    if (outTime != null) {
      _outTime = outTime;
    }
    if (note != null) {
      _note = note;
    }
    if (inIpData != null) {
      _inIpData = inIpData;
    }
    if (outIpData != null) {
      _outIpData = outIpData;
    }
  }

  set inTime(String? inTime) => _inTime = inTime;
  set outTime(String? outTime) => _outTime = outTime;
  set note(String? note) => _note = note;
  set inIpData(String? inIpData) => _inIpData = inIpData;
  set outIpData(String? outIpData) => _outIpData = outIpData;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['in_time'] = _inTime;
    data['out_time'] = _outTime;
    data['note'] = _note;
    data['in_ip_data'] = _inIpData;
    data['out_ip_data'] = _outIpData;
    return data;
  }
}
