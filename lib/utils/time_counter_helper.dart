class TimeCounterHelper {
  TimeCounterHelper._();

  static String getTimeStringFromDouble(double value) {
    int hours = value.toInt();
    int minutes = ((value - hours) * 60).toInt();
    print("$hours:$minutes");
    if (hours.toString().startsWith('0')) {
      return '$minutes m';
    } else if (minutes.toString().startsWith('00')) {
      return '$hours h';
    } else {
      return '$hours h $minutes m';
    }
  }
}
