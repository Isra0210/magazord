import 'package:intl/intl.dart';

extension ExtDouble on double {
  int get celsius => (this - 273.15).ceil();
  double get msToKmH => this * 3.6;
}

extension ExtInt on int {
  String get toDate {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
      this * 1000,
      isUtc: true,
    );
    return DateFormat.yMMMMd("pt_BR").format(date);
  }

  String get hour {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
      this * 1000,
      isUtc: true,
    );
    return DateFormat.Hm("pt_BR").format(date);
  }

  String get day {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
      this * 1000,
      isUtc: true,
    );
    return DateFormat.Md("pt_BR").format(date);
  }
}
