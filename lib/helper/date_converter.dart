import 'package:intl/intl.dart';

class DateConverter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateTime);
  }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime).toLocal();
  }

  static String localDateToIsoStringAMPM(DateTime dateTime) {
    return DateFormat('h:mm a | d-MMM-yyyy ').format(dateTime.toLocal());
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('HH:mm').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd:MM:yy').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToDateOnly(String dateTime) {
    return DateFormat('yyyy-MM-dd E', 'ko').format(isoStringToLocalDate(dateTime));
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime.toLocal());
  }

  static String isoStringToLocalDateAndTime(String dateTime) {
    return DateFormat('dd-MMM-yyyy hh:mm a')
        .format(isoStringToLocalDate(dateTime));
  }

  static String fromNowDuration(String dateTime) {
    var unit = "초";
    var sign = "전";
    var difference =
        DateTime.now().difference(DateTime.parse(dateTime)).inSeconds;
    if (difference > 60) {
      unit = "분";
      difference =
          DateTime.now().difference(DateTime.parse(dateTime)).inMinutes;
    }
    if (difference > 60) {
      unit = "시간";
      difference = DateTime.now().difference(DateTime.parse(dateTime)).inHours;
    }
    if (difference > 24) {
      unit = "일";
      difference = DateTime.now().difference(DateTime.parse(dateTime)).inDays;
    }
    if (difference > 30) {
      unit = "달";
      difference = difference ~/ 30;
    }
    if (difference > 12) {
      unit = "년";
      difference = difference ~/ 12;
    }

    if (difference < 60) {
      sign = "후";
      unit = "분";
      difference =
          DateTime.now().difference(DateTime.parse(dateTime)).inMinutes;
    }
    if (difference < 60) {
      unit = "시간";
      difference = DateTime.now().difference(DateTime.parse(dateTime)).inHours;
    }
    if (difference < 24) {
      unit = "일";
      difference = DateTime.now().difference(DateTime.parse(dateTime)).inDays;
    }
    if (difference < 30) {
      unit = "달";
      difference = difference ~/ 30;
    }
    if (difference < 12) {
      unit = "년";
      difference = difference ~/ 12;
    }

    return "${difference} ${unit} ${sign}";
  }
}
