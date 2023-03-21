class TimeCounterHelper {
  TimeCounterHelper._();

  static String getTimeStringFromDouble(double value) {
    if (value < 0) return 'Invalid Value';
    int flooredValue = value.floor();
    double decimalValue = value - flooredValue;
    String hourValue = _getHourString(flooredValue);
    String minuteString = _getMinuteString(decimalValue);

    if (hourValue.startsWith('0')) {
      return '$minuteString m';
    } else if (minuteString.startsWith('00')) {
      return '$hourValue h';
    } else {
      return '$hourValue h $minuteString m';
    }
  }

  static String getHrsStringFromDouble(double value) {
    if (value < 0) return 'Invalid Value';
    int flooredValue = value.floor();
    String hourValue = _getHourString(flooredValue);
    return hourValue;
  }

  static String getMinsStringFromDouble(double value) {
    if (value < 0) return 'Invalid Value';
    int flooredValue = value.floor();
    double decimalValue = value - flooredValue;
    String minuteString = _getMinuteString(decimalValue);
    return minuteString;
  }

  static String _getMinuteString(double decimalValue) {
    return '${(decimalValue * 60).toInt()}'.padLeft(2, '0');
  }

  static String _getHourString(int flooredValue) {
    return '${flooredValue % 24}';
  }
}
