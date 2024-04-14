extension DateTimeEx on DateTime {
  DateTime convertDate() {
    final offset = timeZoneOffset;
    return toUtc().add(offset);
  }
}

String formatTimeInSeconds(Duration duration, {bool showMinuteOnly = false}) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return showMinuteOnly
      ? '$twoDigitMinutes phút'
      : "$twoDigitMinutes:$twoDigitSeconds";
}

String convertDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}
