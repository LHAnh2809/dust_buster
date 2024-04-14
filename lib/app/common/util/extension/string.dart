import 'dart:io';
import 'package:intl/intl.dart';
import 'package:dust_buster/app/common/util/validators.dart';

import 'time.dart';

const localeVN = 'vi_VN';
const localeEnUS = 'en_US';
const localeFormat = localeEnUS;
final _numFormat = NumberFormat("###,###,###.##", localeFormat);
final numFormatDecimal = NumberFormat("#,##0.00", localeFormat);
final _numFormatCurrency = NumberFormat("\$###,###,###.##", localeFormat);
final _numFormatCurrencyNotDecimal = NumberFormat("###,###,###", localeFormat);
final _dateFormatFull = DateFormat("dd/MM/yyyy HH:mm:ss");
final _dateFormatDMYHHmm = DateFormat("dd/MM/yyyy HH:mm");
final _dateFormatDMY = DateFormat("dd/MM/yyyy");
final _dateFormatMDY = DateFormat("MM/dd/yyyy");
final _formatYMDHMS = DateFormat("yyyyMMddHHmmss");
final _dateFormatDM = DateFormat("dd/MM");
final _dateFormatY = DateFormat("yyyy");
final _dateFormatM = DateFormat("MM");
final _dateFormatD = DateFormat("dd");
final _dateFormatDMYcf = DateFormat("yyyy-MM-ddTHH:mm:ss");
final _dateFormat24h = DateFormat("hh:mm dd/MM/yyyy");
final numFormatter = NumberFormat("#,##0", localeFormat);
final _formatDate = DateFormat("dd-MM-yyyy");
final formatHours = DateFormat("hh:mm a");
final formatDateTime = DateFormat("hh:mm a dd/MM/yyyy");
final _formatMMMYYYY = DateFormat("MMMM yyyy");
final _formatMMMDDYYYY = DateFormat("MMMM dd, yyyy");
final _formatMMYYYY = DateFormat("MM/yyyy");
final _formatEEE = DateFormat("EEE");
final _formatWithOutYY = DateFormat("HH:mm dd MMM");
final formatTime24h = DateFormat("HH:mm");
final formatDMYHHmm = DateFormat("dd/MM/yyyy HH:mm");
final _dateFormatYMD = DateFormat("yyyy-MM-dd");
final formatime24h = DateFormat("HH:mm");
final _dateFormatDMYHHmma = DateFormat("dd/MM/yyyy HH:mm a");
final _dateFormatSalon = DateFormat("MMMM dd, yyyy, HH:mm", localeEnUS);
final _dateFormatSalon12h = DateFormat("MMMM dd, yyyy, hh:mm a", localeEnUS);

///this file's purpose is converting from dynamic to String
///and any files in the parent's folder (ext) work in similar rule

const _kb = 1024;
const _M = 1000000;
//exp: 1%
const _minRate = 1;

extension Nilly on num {
  num get safeNum => this;

  num roundAsFixed(int frag) {
    return toStringAsFixed(frag).strSafeNum;
  }

  num get safePeriodMonth {
    final n = this;
    final x = (n == 0) ? 12 : n;
    return x;
  }

  //109.139.000 -> '109,14'
  //90.000.000 -> '90'
  //90.123.000 -> '90,12'
  //### 900.123 -> '900.123' //hâm => 900 tỉ 123 triệu
  //### min: _M
  //------------
  //9,012 -> '9,01'
  //90,812 -> '90,81'
  //90,689 -> '90,69'
  //90 -> '90'
  //999 -> '999'
  //999,123 -> '999,12'
  //999,999 -> '999,99'
  //max: 999,999 (because: 1000 triệu, hâm)
  String get millionFormat {
    final n = safeNum;
    final d = (n >= _M) ? (n / _M) : n;
    return d._decimalFormat();
  }

  String pad({int pad = 2}) {
    return safeNum.toString().padLeft(2, '0');
  }

  String get mbFormat {
    final n = safeNum / _kb;
    return "${n._decimalFormat()} Mb";
  }

  String get sign => safeNum >= 0 ? "+" : "";

  String get currencyFormat => _numFormatCurrency.format(safeNum);

  String get currencyFormatNotDecimal =>
      _numFormatCurrencyNotDecimal.format(safeNum);

  //for int, x >= 1000
  String get numFormat => _numFormat.format(safeNum);

  //đã chia cho total
  //=> nhân với 100
  String get dividedPercentFormat {
    //return "${(safeNum * 100)}%";
    return "${(safeNum * 100)._decimalFormat()}%";
  }

  String get addZero {
    if (safeNum < 10) {
      return "0$safeNum";
    }
    return "$safeNum";
  }

  //for double, nullable
  String get percentFormat {
    return "${safeNum._decimalFormat()}%";
  }

  String get interestRateFormat {
    return "${_real._decimalFormat()}%";
  }

  String get deleteZeroDouble {
    RegExp regex = Validators.regexDouble;
    return safeNum.toString().replaceAll(regex, '');
  }

  //có thể đã đc api chia 100
  //0.9 => 90
  //0.2 => 20
  //1.1 => 1.1
  //12 => 12
  num get _real {
    final n = safeNum;
    return (n >= _minRate) ? n : n * 100;
  }

  //for double not null
  String _decimalFormat({int fix = 2}) => (this is int)
      ? numFormat
      : _numFormatCurrency.format(double.parse(toStringAsFixed(fix)));

  String get signNumFormat => "$sign$numFormat";
}

extension Dilly on DateTime? {
  String get formatDM => (this != null) ? _dateFormatDM.format(this!) : "";

  String get formatYY => (this != null) ? _dateFormatY.format(this!) : "";

  String get formatMM => (this != null) ? _dateFormatM.format(this!) : "";

  String get formatDD => (this != null) ? _dateFormatD.format(this!) : "";

  String get formatDMY => (this != null) ? _dateFormatDMY.format(this!) : "";
  String get formatDMYV2 => (this != null) ? _formatDate.format(this!) : "";

  String get formatYMDHMS => (this != null) ? _formatYMDHMS.format(this!) : "";

  String get formatDMYformatDMYHHmm =>
      (this != null) ? _dateFormatDMYHHmm.format(this!) : "";

  String get formatFull => (this != null) ? _dateFormatFull.format(this!) : "";

  String get format24h => (this != null) ? _dateFormat24h.format(this!) : "";
  String get formatMMMYYYY =>
      (this != null) ? _formatMMMYYYY.format(this!) : "";
  String get formatMMMDDYYYY =>
      (this != null) ? _formatMMMDDYYYY.format(this!) : "";
  String get formatEEE => (this != null) ? _formatEEE.format(this!) : "";
  String get formatMMYYYY => (this != null) ? _formatMMYYYY.format(this!) : "";
  String get formatWithOutYY =>
      (this != null) ? _formatWithOutYY.format(this!) : "";
  String get formatYMD => (this != null) ? _dateFormatYMD.format(this!) : "";
  String get formatDateSalon =>
      (this != null) ? _dateFormatSalon.format(this!) : "";
  String get formatDateSalon12h =>
      (this != null) ? _dateFormatSalon12h.format(this!) : "";

  String get formatDMYHHmma =>
      (this != null) ? _dateFormatDMYHHmma.format(this!) : "";
  String get chatTime {
    if (this == null) return '';
    final now = DateTime.now();
    if (now.formatDMY == formatDMY) {
      return formatHours.format(this!);
    }
    return DateFormat("hh:mm a").format(this!);
  }

  String get formatHHmm {
    return (this != null) ? formatHours.format(this!) : "";
  }
}

String compareDateToDate(DateTime? checkIn, DateTime? checkOut) {
  if (checkIn != null && checkOut != null) {
    final Duration duration = checkOut.difference(checkIn);
    return convertDuration(duration);
  }
  return "_";
}

extension Dlly on dynamic {
  DateTime? get toDate {
    final value = this;
    if (value == null) return null;
    if (value is DateTime) return value;
    //if (value is Timestamp) return value.toDate();
    if (value is String) return value.strToDate;
    return null;
  }
}

const pdf = '.pdf';

extension Silly on String? {
  String? get unBreak => this != null ? this!.replaceAll('\n', '') : null;
  bool isPdf({bool get = false}) {
    final url = this != null ? this!.toLowerCase() : null;
    return get || !Platform.isIOS
        ? url?.contains(pdf) ?? false
        : url?.endsWith(pdf) ?? false;
  }

  String get toPdfPath {
    var path = this != null
        ? this!.substring(this!.lastIndexOf("://") + 1).replaceAll("/", "_")
        : "";
    if (!path.isPdf()) path += pdf;
    return path;
  }

  //f: formatted
  int? get fToInt => int.tryParse(this!.replaceAll(",", ""))?.safeNum as int;

  int get trimLength => this?.replaceAll(' ', '').length ?? 0;

  int get safeLength => this?.length ?? 0;

  String get spreadFormat => "${this} m2";

  DateTime get dateOrNow {
    final value = this;
    return !value.isNullOrEmpty ? _dateFormatDMY.parse(value!) : DateTime.now();
  }

  DateTime get dateReport {
    final value = this;
    return !value.isNullOrEmpty ? _dateFormatMDY.parse(value!) : DateTime.now();
  }

  DateTime get dateCustomer {
    final value = this;
    return !value.isNullOrEmpty ? _dateFormatYMD.parse(value!) : DateTime.now();
  }

  //2020-03-15T09:21:26.000Z
  DateTime? get strToDateCf {
    return isNullOrEmpty ? null : _dateFormatDMYcf.parse(this!);
  }

  DateTime? get strToDate {
    return isNullOrEmpty ? null : _dateFormatDMY.parse(this!);
  }

  String get parenthesesFormat => "($this)";

  int? get toInt => this != null ? int.tryParse(this!) : null;

  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;

  String? get formatPhoneNumber {
    var phone = this;
    if (phone != null) {
      if (phone.startsWith("+84")) return phone;
      phone = this!.replaceAll("[^\\d.]", "");
      if (phone.startsWith('0')) {
        phone = this!.replaceFirst('0', '84');
      }
      final builder = StringBuffer();
      builder.write('+');
      if (phone.startsWith('84')) {
        builder.write(phone);
      } else {
        builder
          ..write('84')
          ..write(phone);
      }
      return builder.toString();
    }
    return null;
  }

  String get replace0Phone {
    return this!.replaceFirst(RegExp(r'^0+'), "");
  }

  String? get correctUrl {
    final url = this;
    if (url != null) {
      var start = url.indexOf("http://");
      if (start < 0) start = url.indexOf("https://");
      return start <= 0 ? url : url.substring(start);
    }
    return null;
  }

  String get strDecimal {
    return strSafeNum._decimalFormat();
  }

  num get strSafeNum {
    if (isNullOrEmpty) return 0;
    return double.tryParse(this!)!.safeNum;
  }

  String get normalSearchText {
    if (this == null) return '';
    return this!.trim().toLowerCase();
  }

  String get capitalize {
    if (isNullOrEmpty) return "";
    return "${this![0].toUpperCase()}${this!.substring(1)}";
  }
}

String simplePhoneNumber(String? phoneNumber) {
  if (phoneNumber == null) return "";

  var normal = phoneNumber.replaceAll(RegExp(r'[^\d.-]'), "");
  if (normal.startsWith("84")) {
    normal = normal.replaceFirst("84", "0");
  }

  return normal;
}

bool isEmail(String? email) {
  if (email == null || email.trim().isEmpty) return false;

  return RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)")
      .hasMatch(email);
}
