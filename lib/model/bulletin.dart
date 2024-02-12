import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Bulletin {
  String bulletinUrl;
  DateTime bulletinDate;

  String getDateString() {
    var dateString = DateFormat('yyyy-MM-dd').format(bulletinDate);
    return dateString;
  }

  Bulletin(this.bulletinUrl, this.bulletinDate);

  void openBulletinLink() async {
    if (await canLaunchUrl(Uri.parse(bulletinUrl))) {
      await launchUrl(Uri.parse(bulletinUrl), mode: LaunchMode.externalApplication);
    } else {
      throw "Error downloading bulletin";
    }
  }
}