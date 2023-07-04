class RequestAttendanceChangeReq {
  String? inDate;
  String? inTime;
  String? outTime;
  String? note;

  RequestAttendanceChangeReq(
      {this.inDate, this.inTime, this.outTime, this.note});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['in_date'] = inDate;
    data['in_time'] = inTime;
    data['out_time'] = outTime;
    data['note'] = note;
    return data;
  }

  @override
  String toString() {
    return 'RequestAttendanceChangeReq{inDate: $inDate, inTime: $inTime, outTime: $outTime, note: $note}';
  }
}
