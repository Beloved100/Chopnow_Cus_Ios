import 'package:intl/intl.dart';

String formatDate(String isoDate) {
  DateTime date = DateTime.parse(isoDate);
  final DateFormat dateFormatter = DateFormat('dd-MMM-yyyy');
  return dateFormatter.format(date);
}
