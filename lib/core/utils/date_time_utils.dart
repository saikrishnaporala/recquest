import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String DD_MM_YYYY = 'dd/MM/yyyy';
const String YYYY_MM_DD = 'yyyy-MM-dd';
const String HH_mm = 'HH:mm';

extension DateTimeExtension on DateTime {
  String format([String pattern = DD_MM_YYYY, String? locale]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}
