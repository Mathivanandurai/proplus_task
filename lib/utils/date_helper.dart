import 'package:intl/intl.dart';

class DateUtil {
  static final DateTime date = DateTime.now();
  static String format = "dd-MMM-yy";
  static String ddmmyyyy = "dd-MMM-yyyy";

  static String dateMonthYearSlash(DateTime val) {
    return DateFormat("dd/MM/yy hh:mma").format(val); // 17/05/23 09:30AM
  }
}
