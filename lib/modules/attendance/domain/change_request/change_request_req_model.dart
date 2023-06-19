class ChangeRequestReqModel {
  String? _inTime;
  String? _outTime;
  String? _note;

  ChangeRequestReqModel(
      { String? inTime,
        String? outTime,
        String? note}) {
  }


  @override
  String toString() {
    return 'ChangeRequestReqModel{_inTime: $_inTime, _outTime: $_outTime, _note: $_note}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['in_time'] = _inTime;
    data['out_time'] = _outTime;
    data['note'] = _note;
    return data;
  }
}
