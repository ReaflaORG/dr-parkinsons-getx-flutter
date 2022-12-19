import 'package:intl/intl.dart';

class Formmater {
  // * 날짜 데이터틀 yyyy-MM-dd 형태로 전환해주는 함수
  static String dateTimeFormat(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  // * 날짜 데이터틀 yy.MM.dd 형태로 전환해주는 함수
  static String dateTimeFormatYYMMDD(DateTime date) {
    return DateFormat('yy.MM.dd').format(date);
  }
}
