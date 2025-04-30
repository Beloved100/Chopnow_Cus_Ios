import 'package:get/get.dart';
import 'package:intl/intl.dart';

String formatPrice(dynamic price) {
  var formatter = NumberFormat('#,###');

  // Handle RxInt, int, and String cases
  int formattedPrice;

  if (price is RxInt) {
    formattedPrice = price.value;
  } else if (price is int) {
    formattedPrice = price;
  } else if (price is String) {
    formattedPrice = int.tryParse(price) ?? 0;
  } else {
    throw ArgumentError('Invalid price type');
  }

  return formatter.format(formattedPrice);
}
