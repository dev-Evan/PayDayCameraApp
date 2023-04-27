class ChangeRequestReqModel {
  String? _inTime;
  String? _outTime;
  String? _note;

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
  }

  set inTime(String? inTime) => _inTime = inTime;
  set outTime(String? outTime) => _outTime = outTime;
  set note(String? note) => _note = note;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['in_time'] = _inTime;
    data['out_time'] = _outTime;
    data['note'] = _note;
    return data;
  }
}
