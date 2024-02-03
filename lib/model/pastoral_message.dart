import 'package:intl/intl.dart';

class PastoralMessage {
  String messageTitle;
  DateTime messageDate;
  String messageBody;

  String getDateString() {
    var dateString = DateFormat('yyyy-MM-dd').format(messageDate);
    return dateString;
  }

  PastoralMessage(this.messageTitle, this.messageDate, this.messageBody);
}