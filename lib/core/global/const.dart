// ignore_for_file: deprecated_member_use

import 'package:intl/intl.dart';

import '../services/network_service.dart/dio_network_service.dart';

const String dummyImage = "https://picsum.photos/800";

final NetworkService networkService = NetworkService(
  baseUrl: APIKeys.baseUrl,
  httpHeaders: {
    'Accept': 'application/json',
  },
);
String appDateFormat(DateTime date) {
  String pattern = 'yyyy-MM-dd';
  var format = DateFormat(pattern, "en");
  var dateString = format.format(date);
  return dateString;
}

String appTimeFormat(DateTime time) {
  String pattern = 'HH:mm';
  var format = DateFormat(pattern, "en");
  var timeString = format.format(time);
  return timeString;
}

extension Filter<T> on Stream<List<T>> {
  Stream<List<T>> filter(bool Function(T) where) => map(
        (items) => items.where(where).toList(),
      );
}

extension CustomList<T> on List<T> {
  List<T> asReversed(bool isReverse) {
    return isReverse ? reversed.toList() : this;
  }

  T? elementAtOrNull(int index) {
    try {
      return this[index];
    } catch (_) {}
    return null;
  }
}

const int pageLimit = 10;

class APIKeys {
  static const String baseUrl = "";
}
