import 'package:intl/intl.dart';

class DateTimeHelper {
  String dateParser(date) {
   var parsedDate = DateFormat("dd MMM yyyy").format(DateTime.parse(date));
    return parsedDate;
  }
  String dayNameParser(date) {
    var parsedDate = DateFormat("EEEE, ").format(DateTime.parse(date));
    return parsedDate;
  }
  String timeParser(date) {
    var parsedDate = DateFormat("HH:mm a").format(DateTime.parse(date));
    return parsedDate;
  }
}
