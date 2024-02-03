import 'package:intl/intl.dart';

class Bulletin {
  String bulletinUrl;
  DateTime bulletinDate;

  String getDateString() {
    var dateString = DateFormat('yyyy-MM-dd').format(bulletinDate);
    return dateString;
  }

  Bulletin(this.bulletinUrl, this.bulletinDate);
}