import 'package:intl/intl.dart';

double toDouble(value, [double defaultValue = 0]) {
  if (value == null) return defaultValue;
  double? result;
  if (value is num) {
    result = value.toDouble();
  } else if (value is String && value.isNotEmpty) {
    result = double.tryParse(value);
  }
  return result ?? defaultValue;
}

int toInt(value, [int defaultValue = 0]) {
  if (value == null) return defaultValue;
  int? result;
  if (value is num) {
    result = value.toInt();
  } else if (value is String && value.isNotEmpty) {
    result = int.tryParse(value);
  } else if (value is bool) {
    result = value ? 1 : 0;
  }
  return result ?? defaultValue;
}

bool toBool(value, [bool defaultValue = false]) {
  if (value == null) return defaultValue;

  if (value is bool) {
    return value;
  }
  final String strValue = value.toString().toLowerCase();
  if (strValue == 'true' || strValue == '1') {
    return true;
  } else if (strValue == 'false' || strValue == '0') {
    return false;
  }
  return defaultValue;
}

DateTime? getDateLocal(DateTime? dateTime, {bool isUtc = true}) {
  if (dateTime == null) return null;
  if (isUtc) {
    return dateTime.toUtc();
  } else {
    return dateTime.toLocal();
  }
}

_getDateFromUnixTimeStamp(String? unixTime) {
  if (unixTime == null || unixTime.isEmpty) return null;
  if (unixTime.length <= 10) {
    return DateTime.fromMillisecondsSinceEpoch(
        toDouble(unixTime).toInt() * 1000);
  } else {
    return DateTime.fromMillisecondsSinceEpoch(toDouble(unixTime).toInt());
  }
}

DateTime? getDateFormat(String? value, String? format) {
  DateTime time = DateTime.now();
  try {
    if (value == null) return null;
    if (format != null) {
      try {
        time = DateFormat(format).parse(value);
      } catch (e) {
        time = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUtc(value).toLocal();
      }
    }
    return time;
  } catch (e) {
    return time;
  }
}

String toFileUrl(String? baseUrl, String? url) {
  if (url == null) return "";
  return '$baseUrl$url';
}

String fileSize(double size) {
  double d1 = size / 1024.0;
  double d2 = d1 / 1024.0;
  double d3 = d2 / 1024.0;
  if (size < 1024.0) {
    return size.toString() + " bytes";
  }
  if (d1 < 1024.0) {
    return d1.round().toString() + " KB";
  }
  if (d2 < 1024.0) {
    return d2.round().toString() + " MB";
  }
  return d3.round().toString() + " GB";
}
