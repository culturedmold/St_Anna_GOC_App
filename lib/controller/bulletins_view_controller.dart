import '../firebase_access/firestore_access.dart';
import '../model/bulletin.dart';

class BulletinViewController {
  late List<Bulletin> bulletinsList = [];

  Future<List<Bulletin>> fetchBulletins() async {
    if (bulletinsList.isNotEmpty) { // Set the list to empty if it's not already, so we can ensure fresh data from the API when performing refreshes
      bulletinsList = [];
    }

    await FireStoreAccess.db.collection("BulletinLinks").get().then((event) {
      for (var doc in event.docs) {
        var bulletinUrl = doc["URL"];
        var bulletinDate = DateTime.parse(doc["bulletinDate"].toDate().toString());

        var bulletin = Bulletin(bulletinUrl, bulletinDate);
        bulletinsList.add(bulletin);
      }
    });
    bulletinsList.sort((a, b) => b.bulletinDate.compareTo(a.bulletinDate));
    return bulletinsList;
  }
}